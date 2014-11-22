function [ pbelonging ] = decisionclassifier1( rectangles, image, vectordistancelearning, d )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    nbrectangles = size(rectangles);
    vectordistance = zeros(nbrectangles, 2*d);

    pbelonging = zeros(nbrectangles, 10);
    for i=1:nbrectangles
        % Extract profiles of the image to be tested
        top = rectangles(i, 1) + 1;
        bottom = rectangles(i, 3) - 1;
        left = rectangles(i, 2) + 1;
        right = rectangles(i, 4) - 1;
        vectordistance(i, 1:2*d) = extractprofile(image(top:bottom, left:right));
        % Compute the distance vectors (distance between the center of each class and 
        % the center of the class to be tested)
        pbelonging(i, 1:10) = computepdistances(vectordistancelearning, vectordistance(i, 1:10));
    end

end

