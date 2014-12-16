function [ rate ] = computerecognitionrate( resultvector )
% COMPUTERECOGNITIONRATE Calculate the recognition rate function of an
% obtained result
%   RATE = COMPUTERECOGNITIONRATE(RESULTVECTOR) 

    rate = 0;
    % Over 100 objects, count down the correctly identified ones
    for i = 1:100 
       if resultvector(i) == floor((i-1)/10) + 1;
           rate = rate + 1;
       end
    end

    % Divides counter by the totalnumber of objects to obtain a percentage
    rate = rate/100;
end

