function [ rects ] = seekrectangle( image, lines, cols )
% SEEKRECTANGLE Seek for rectangle around number
%   RECTS = SEEKCOLUMNS(IMAGE, LINES, COLS), for a matrix of [X, 4],
%   containing coordinates of the rectangle (top, left, bottom, right)

    % Number of lines
    l = size(lines, 1);
    % Number of columns
    c = size(cols, 2);
    % Number of rectangles
    rects = zeros((l*c)/2, 4);
    % Counter for the matrix
    k = 1;
    
    % Skim through each line and column, and add a 1px-large white band
    % around the rectangle
    for i=1:l,
        for j=1:2:c - 1,
            % Re-cut the line for a column, to get a sharper image
            line = seeklines(image(lines(i, 1):lines(i, 2), cols(i, j):cols(i, j+1)));
            rects(k, 1) = lines(i, 1) + line(1, 1) - 2; % top
            rects(k, 2) = cols(i, j) - 1; % left
            rects(k, 3) = lines(i, 1) + line(1, 2); % bottom
            rects(k, 4) = cols(i, j + 1) + 1; % right
            
            % Next in the matrix
            k = k + 1;
        end
    end
end

