function [ rate ] = computerecognitionrate( resultvector )

    rate = 0;
    for i = 1:100 
       if resultvector(i) == floor((i-1)/10) + 1;
           rate = rate + 1;
       end
    end

    rate = rate/100;
end

