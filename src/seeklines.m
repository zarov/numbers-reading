function [ steps ] = seeklines( image )
% SEEKLINES Seek for lines of numbers in a picture
%   STEPS = SEEKLINES(IMAGE), for a matrix with X lines containing each
%   step of not-only-white lines of the IMAGE

    % Total pixels lines
    n = size(image, 1);

    % Sum of each black pixel on every line
    projH = sum(image < 50, 2);
    
    % Steps
    steps = zeros(0, 0);
    step = zeros(1, 2);

    % Counters for each line
    l = 1;

    % Skim through each line
    while l <= n
        % If it is a black pixel, then
        if projH(l) ~= 0
            % The step begin at the first line
            step(1, 1) = l;
            
            % Search for the last line
            while (l <= n && projH(l) ~= 0)
                l = l + 1;
            end

            % The end of the step
            step(1, 2) = l - 1;
            steps = [steps;step];
        end
        
        % Next line
        l = l + 1;
    end
    
end