function [ columns ] = seekcolumns( image, lines )
% SEEKCOLUMNS Seek for columns of numbers in the colored lines of a picture
%   STEPS = SEEKCOLUMNS(IMAGE, LINES), for a matrix with X lines containing 
%   each step of not-only-white columns of LINES of the IMAGE

    % Total pixel columns
    n = size(image, 2);
    % Total pixel lines
    k = size(lines, 1);
    
    columns = zeros(k, 0);
    
    % Go through each line, previously determined
    for i=1:k,
        l = image(lines(i, 1):lines(i, 2), 1:n);
        
        % Sum of each black pixel on every column
        projV = sum(l < 50);
        % plot(projV); 
        
        % Counter for each column
        c = 1;
        p = 1;

        % Skim through each column
        while c <= n
            % If it is a black pixel, then
            if projV(c) ~= 0
                % Beginning of the step
                columns(i, p) = c;
                p = p + 1;
                
                % Search for the end
                while projV(c) ~= 0
                    c = c + 1;
                end

                % End of the step
                columns(i, p) = c - 1;
                p = p + 1;
            end

            % Next column
            c = c + 1;
        end
    end
end

