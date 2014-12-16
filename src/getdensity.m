function [ density ] = getdensity( rectangle, m, n)
% GETDENSITY Compute densities of marked pixel in a rectangle using zoning method
%   DENSITY = GETDENSITY(RECTANGLE, M, N)

    h = size(rectangle, 1);
    w = size(rectangle, 2);
   
    % Compute the m*n areas to analyze, according to height and width
    hstep = linspace(1, h, m+1);
    wstep = linspace(1, w, n+1);
    density = zeros(m*n, 1);

    % For each area
    for j=1:m
        for i = 1:n           
            % Go through every pixel of the area and count the black ones
            for l = floor(hstep(j)) : floor(hstep(j+1)) -1
                for c = floor(wstep(i)) : floor(wstep(i+1)) -1
                    if rectangle(l, c) == 0
                        density(j + (i-1)*m) = density(j + (i-1)*m) + 1;
                    end
                end
            end
        end
    end
    
    % Normalize obtained densities
    density = density ./ (h*w);
end