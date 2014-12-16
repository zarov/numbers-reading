function [  ] = drawrectangle( image, rectangles )
% DRAWRECTANGLE Draw surrounding rectangles in a image of numbers

    figure('name','Localisation des chiffres')
    % Open the image
    imshow(image);
    hold on;
    
    n = size(rectangles, 1);
    
    % For each rectangle
    for i=1:n,
        % Compute the width and height
        h = rectangles(i, 3) - rectangles(i, 1);
        w = rectangles(i, 4) - rectangles(i, 2);
        
        % Draw the rectangle
        rectangle('position', [rectangles(i, 2), rectangles(i, 1), w, h], 'Edgecolor', 'r');
    end
    
    hold off;
end

