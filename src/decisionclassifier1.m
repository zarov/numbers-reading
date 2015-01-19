function [ pbelonging ] = decisionclassifier1( rectangles, image, vectordistancelearning, d )
% DECISIONCLASSIFIER1 Decision phase for classifier 1
%   PBELONGING = DECISIONCLASSIFIER1(RECTANGLES, IMAGE,
%   VECTORDISTANCELEARNING, D)

    nbrectangles = size(rectangles);
    vectordistance = zeros(nbrectangles(1), 2*d);

    pbelonging = zeros(nbrectangles(1), 10);
    
    for i=1:nbrectangles
        % Extract profiles of the image to be tested
        top = rectangles(i, 1) + 1;
        bottom = rectangles(i, 3) - 1;
        left = rectangles(i, 2) + 1;
        right = rectangles(i, 4) - 1;
        vectordistance(i, 1:2*d) = extractprofile(image(top:bottom, left:right), d);
        % Compute the distance vectors (distance between the center of each class and 
        % the center of the class to be tested)
        pbelonging(i, 1:10) = computepdistances(vectordistancelearning, vectordistance(i, 1:2*d), d);
    end
    
    % Plot results
    figure('name','Probabilités obtenues avec le premier classifieur pour chaque classe en fonction des objets à identifier')
    x = 1:1:nbrectangles;
    subplot(5,2,1), plot(x, pbelonging(x,1))
    subplot(5,2,2), plot(x, pbelonging(x,2))
    subplot(5,2,3), plot(x, pbelonging(x,3))
    subplot(5,2,4), plot(x, pbelonging(x,4))
    subplot(5,2,5), plot(x, pbelonging(x,5))
    subplot(5,2,6), plot(x, pbelonging(x,6))
    subplot(5,2,7), plot(x, pbelonging(x,7))
    subplot(5,2,8), plot(x, pbelonging(x,8))
    subplot(5,2,9), plot(x, pbelonging(x,9))
    subplot(5,2,10), plot(x, pbelonging(x,10))
end

