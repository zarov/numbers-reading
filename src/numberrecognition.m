function [result] = numberrecognition(d, k, m, n)
% NUMBERRECOGNITION Identify handwritten numbers in an image
%   RESULT = NUMBERRECOGNITION(D, K, M, N)


% Load learning image 
learningimage = imread('../data/app.tif');
image = imread('../data/test.tif');

%% Locate numbers positions in both learning image and image to be tested
% Seek lines
lineslearning = seeklines(learningimage);
lines = seeklines(image);

% Seek columns
columnslearning = seekcolumns(learningimage, lineslearning);
columns = seekcolumns(image, lines);

% Seek and draw rectangles
rectangleslearning = seekrectangle(learningimage, lineslearning, columnslearning);
rectangles = seekrectangle(image, lines, columns);
drawrectangle(learningimage, rectangleslearning);
drawrectangle(image, rectangles);

% Save results
%save('coordinatesrectangleslearning.mat', 'rectangleslearning', '-ascii');
%save('coordinatesrectangles.mat', 'rectangles', '-ascii');

%% Classifier #1 : profile + minimal Euclidean distance
%d = 5;

% Learning Phase
vectordistancelearning = learningclassifier1( rectangleslearning, learningimage, d);

% Decision Phase
pbelonging1 = decisionclassifier1( rectangles, image, vectordistancelearning, d);


%% Classifier #2 : density + KPPV
%m = 5;
%n = 5;
%k = 1;

% Learning phase
vectordensitylearning = learningclassifier2( rectangleslearning, learningimage, m, n);

% Decision Phase
pbelonging2 = decisionclassifier2( rectangles, image, vectordensitylearning, m, n, k);


%% Combination of the two obtained decisions

[~, m] = max(pbelonging1, [], 2);
resultcl1 = m;
[~, m] = max(pbelonging2, [], 2);
resultcl2 = m;

pbelonging1;
pbelonging2;

% Combination by sum of probabilities
pbelongingsum = pbelonging1 + pbelonging2;

% Combination by product of probabilities
pbelongingprod = pbelonging1 .* pbelonging2;

% Show obtained result for each combination
[~, m] = max(pbelongingsum, [], 2);
resultsum = m;

[~, m] = max(pbelongingprod, [], 2);
resultprod = m;

%% Return all of the four results rates

result = [computerecognitionrate(resultcl1);
          computerecognitionrate(resultcl2);
          computerecognitionrate(resultsum);
          computerecognitionrate(resultprod)];
