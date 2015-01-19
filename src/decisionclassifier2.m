function [ pbelonging ] = decisionclassifier2( rectangles, image, vectordensitylearning, m, n, k )
% DECISIONCLASSIFIER2 Decision phase for classifier 2
%   PBELONGING = DECISIONCLASSIFIER2(RECTANGLES, IMAGE,
%   VECTORDENSITYLEARNING, M, N, K)

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

%   Plot results
    figure('name','Probabilités obtenues avec le second classifieur pour chaque classe en fonction des objets à identifier')
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

