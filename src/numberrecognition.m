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
save('coordinatesrectangleslearning.mat', 'rectangleslearning', '-ascii');
save('coordinatesrectangles.mat', 'rectangles', '-ascii');

nbrectangleslearning = size(rectangleslearning, 1);
nbrectangles = size(rectangles, 1);


%% Classifier #1 : profile + minimal Euclidean distance
d = 5;

% Learning Phase
vectordistancelearning = learningclassifier1( rectangleslearning, learningimage, d);

% Decision Phase
pbelonging1 = decisionclassifier1( rectangles, image, vectordistancelearning, d);


%% Classifier #2 : density + KPPV
m = 5;
n = 5;
k = 1;

% Learning phase
vectordensitylearning = learningclassifier2( rectangleslearning, learningimage, m, n);

% Decision Phase
pbelonging2 = decisionclassifier2( rectangles, image, vectordensitylearning, m, n, k);


%% Combination of the two obtained decisions

% Combination by sum of probabilities
pbelongingsum = pbelonging1 + pbelonging2;
% Combination by product of probabilities
pbelongingprod = pbelonging1 .* pbelonging2;

% Show obtained result for each combination
[~, m1] = max(pbelongingsum, [], 2);
resultsum = m1;

[~, m2] = max(pbelongingprod, [], 2);
resultprod = m2;

%% Analysis of results function of parameters d, m, n, and k

computerecognitionrate(resultsum);
computerecognitionrate(resultprod);
