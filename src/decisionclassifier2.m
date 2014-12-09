function [ pbelonging ] = decisionclassifier2( rectangles, image, vectordensitylearning, m, n, k )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    nbrectangles = size(rectangles);
    [nbrectangleslearning, ~] = size(vectordensitylearning);
    vectordensity = zeros(nbrectangles(1), m*n);
    pbelonging = zeros(nbrectangles(1), 10);

    for i=1:nbrectangles
        % Compute the density of black pixels in each of the m*n area for 
        % each rectangle 
        top = rectangles(i, 1) + 1;
        bottom = rectangles(i, 3) - 1;
        left = rectangles(i, 2) + 1;
        right = rectangles(i, 4) - 1;
        vectordensity(i, 1:n*m) = getdensity(image(top:bottom, left:right), m, n);

        % Compute probabilities of rectangle i belonging to each of the ten
        % classes thanks to KPPV
        pbelonging(i, 1:10) = computepdensities(vectordensity(i, 1:n*m), vectordensitylearning, nbrectangleslearning, k, n*m);
    end

end

