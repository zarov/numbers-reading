function [vectordensitylearning] = learningclassifier2( rectangleslearning, learningimage, m, n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
    nbrectangleslearning = size(rectangleslearning);
    vectordensitylearning = zeros(nbrectangleslearning(1), m*n);
    
    % Compute density of black pixels in each one of the m*n area for each 
    % element of the ten classes
    for i=1:nbrectangleslearning
        topl = rectangleslearning(i, 1) + 1;
        bottoml = rectangleslearning(i, 3) - 1;
        leftl = rectangleslearning(i, 2) + 1;
        rightl = rectangleslearning(i, 4) - 1;
        vectordensitylearning(i, 1:n*m) = getdensity(learningimage(topl:bottoml, leftl:rightl), m, n);
    end
    
    save(['vectordensitylearning_' num2str(m) '_' num2str(n) '.mat'], 'vectordensitylearning', '-ascii');
    
end

