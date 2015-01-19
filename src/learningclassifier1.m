function [vectordistancelearning] = learningclassifier1( rectangleslearning, learningimage, d )
%LEARNINGCLASSIFIER1 Learning phase for classifier 1
%   VECTORDISTANCELEARNING =
%   LEARNINGCLASSIFIER1(RECTANGLESLEARNING, LEARNINGIMAGE, D)

    nbrectangleslearning = size(rectangleslearning);
    vectortempdistancelearning = zeros(nbrectangleslearning(1), 2*d);

    % Extract left and right profiles from each element of the ten classes
    for i=1:nbrectangleslearning
        topl = rectangleslearning(i, 1) + 1;
        bottoml = rectangleslearning(i, 3) - 1;
        leftl = rectangleslearning(i, 2) + 1;
        rightl = rectangleslearning(i, 4) - 1;
        vectortempdistancelearning(i, 1:2*d) = extractprofile(learningimage(topl:bottoml, leftl:rightl), d);
    end

    % Compute the d*2 mean vectors (left and right) for each class
    vectordistancelearning = zeros(10, 10);
    for i=1:10
        vectordistancelearning(i, 1:2*d) = mean(vectortempdistancelearning(i*20 - 19:i*20, 1:2*d));
    end

    %save(['vectordistancelearning_' num2str(d) '.mat'], 'vectordistancelearning', '-ascii');

end

