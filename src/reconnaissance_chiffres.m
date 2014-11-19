clear

%% Locate numbers positions in both learning image and image to be tested
% Load learning image 
learningimage = imread('../data/app.tif');
image = imread('../data/test.tif');

% Seek lines
lineslearning = seeklines(learningimage);
lines = seeklines(image);

% Seek columns
columnslearning = seekcolumns(learningimage, lineslearning);
columns = seekcolumns(image, lines);

% Seek and draw rectangles
rectangleslearning = seekrectangle(learningimage, lineslearning, columnslearning);
rectangles = seekrectangle(image, lines, columns);
%drawrectangle(learningimage, rectangleslearning);
%drawrectangle(image, rectangles);

% Save results
save('coordinates.mat', 'rectangleslearning', '-ascii');
save('coordinate_test.mat', 'rectangles', '-ascii');

nbrectangleslearning = size(rectangleslearning, 1);
nbrectangles = size(rectangles, 1);


%% Classifier #1 : profile + minimal Euclidean distance

% Learning Phase
% Extract profiles of each class
d = 5;
vectordistancelearning = zeros(nbrectangleslearning, 2*d);

for i=1:nbrectangleslearning
    topl = rectangleslearning(i, 1) + 1;
    bottoml = rectangleslearning(i, 3) - 1;
    leftl = rectangleslearning(i, 2) + 1;
    rightl = rectangleslearning(i, 4) - 1;
    vectordistancelearning(i, 1:2*d) = extractprofile(learningimage(topl:bottoml, leftl:rightl));
end

% Compute the mean vector (center) for each class
centerslearning = zeros(10, 10);
for i=1:10
    centerslearning(i, 1:10) = mean(vectordistancelearning(i*20 - 19:i*20, 1:10));
end

save('center.mat', 'centerslearning', '-ascii');

% Decision Phase
% Extract profiles of the image to be tested
vectordistance = zeros(nbrectangles, 2*d);

pbelonging1 = zeros(nbrectangles, 10);
for i=1:nbrectangles
    top = rectangles(i, 1) + 1;
    bottom = rectangles(i, 3) - 1;
    left = rectangles(i, 2) + 1;
    right = rectangles(i, 4) - 1;
    vectordistance(i, 1:2*d) = extractprofile(image(top:bottom, left:right));
    % Compute the distance vectors (distance between the center of each class and 
    % the center of the class to be tested)
    pbelonging1(i, 1:10) = computepdistances(centerslearning, vectordistance(i, 1:10));
end


%% Classifier #2 : density + KPPV
% Compute density for each zone of each class
m = 5;
n = 5;
vectordensitylearning = zeros(nbrectangleslearning, 25);

% Learning phase
% Compute density of black pixels for each one of the m*n area for each 
% rectangle (learning image)
for i=1:nbrectangleslearning
    topl = rectangleslearning(i, 1) + 1;
    bottoml = rectangleslearning(i, 3) - 1;
    leftl = rectangleslearning(i, 2) + 1;
    rightl = rectangleslearning(i, 4) - 1;
    vectordensitylearning(i, 1:n*m) = getdensity(learningimage(topl:bottoml, leftl:rightl), m, n);
end

% Decision Phase
% Compute density of black pixels for each one of the m*n area for each 
% rectangle 
vectordensity = zeros(nbrectangles, 25);
pbelonging2 = zeros(nbrectangles, 10);

for i=1:nbrectangles
    top = rectangles(i, 1) + 1;
    bottom = rectangles(i, 3) - 1;
    left = rectangles(i, 2) + 1;
    right = rectangles(i, 4) - 1;
    vectordensity(i, 1:n*m) = getdensity(image(top:bottom, left:right), m, n);
    
    % Compute the probabilities of rectangle i belonging to each of the ten
    % classes thanks to KPPV
    k = 15;
    pbelonging2(i, 1:10) = computepdensities(vectordensity(i, 1:n*m), vectordensitylearning, nbrectangleslearning, k);
end


%% Combination of the two obtained decisions

% Combination by sum of probabilities
pbelongingsum = pbelonging1 + pbelonging2;
% Combination by product of probabilities
pbelongingprod = pbelonging1 .* pbelonging2;

%Show obtained result for each combination
[~, m2] = max(pbelongingsum, [], 2);
resultsum = m2

[~, m2] = max(pbelongingprod, [], 2);
resultprod = m2
