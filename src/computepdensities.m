function [ pbelonging ] = computepdensities( vectordensity, vectordensitylearning, nbrectangleslearning, k, mn)
% COMPUTEPDENSITIES Compute probabilities of belonging according to
% densities
%    PBELONGING = COMPUTEPDENSITIES(VECTORDENSITY,
%    VECTORDENSITYLEARNING, NBRECTANGLESLEARNING, K, MN)

    distancetoneighboors = zeros(nbrectangleslearning, 2);
    % Compute distances between every objects of the learning basis and the
    % class to be tested
    for i = 1:nbrectangleslearning
        distancetoneighboors(i, 1) = sum(abs(vectordensity - vectordensitylearning(i, 1:mn)));
        distancetoneighboors(i, 2) = ceil(i/20); % class of belonging = i 
                                                 % divided by the number of
                                                 % models for this class in
                                                 % the learning image
    end
    
    % Sort the learning objects function of their proximity to the rectangle
    [~,d2] = sort(distancetoneighboors(:, 1));
    distancetoneighboors = distancetoneighboors(d2,:);
    
    % Compute the probability of rectangle belonging to each class
    neighboors = zeros(10, 1);
    % Find number of neighboors for each class among the k closest neighboors
    for i = 1:k 
        distancetoneighboors(i,2);
        neighboors(distancetoneighboors(i,2)) = neighboors(distancetoneighboors(i,2)) + 1;
    end
    
    % Compute the matching probability for each class
    pbelonging = neighboors ./ k;
end

