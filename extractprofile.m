function [ profile ] = extractprofile( base )
    w = size(base, 2);
    h = size(base, 1);
    
    % Compute the 5 lines to analyze, according to height
    hstep = linspace(1, h, 5);
    profile = zeros(10, 1);

    % For each line, find left and right
    for j=1:5
        line = floor(hstep(j));

        % Left and right departure
        l = 1;
        r = w;

        % Until left found, iter (left departure)
        while base(line, l) ~= 0
            l = l + 1;
        end

        % Until right found, iter (right departure)
        while base(line, r) ~= 0
            r = r - 1;
        end

        % Normalize the profile
        profile(j, 1) = (l / 2) / w;
        profile(j + 5, 1) = (r / 2) / w;
    end
end