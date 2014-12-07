function [ pbelonging ] = computepdistances( centerslearning, vectordistance)
 
    pbelonging = zeros(10, 1);
    distances = [   sum(abs(centerslearning(1, 1:10) - vectordistance));
                    sum(abs(centerslearning(2, 1:10) - vectordistance));
                    sum(abs(centerslearning(3, 1:10) - vectordistance));
                    sum(abs(centerslearning(4, 1:10) - vectordistance));
                    sum(abs(centerslearning(5, 1:10) - vectordistance));
                    sum(abs(centerslearning(6, 1:10) - vectordistance));
                    sum(abs(centerslearning(7, 1:10) - vectordistance));
                    sum(abs(centerslearning(8, 1:10) - vectordistance));
                    sum(abs(centerslearning(9, 1:10) - vectordistance));
                    sum(abs(centerslearning(10, 1:10) - vectordistance))];
     for i = 1:10
         pbelonging(i) = exp(-1*distances(i))/sum(exp(-1*distances));         
     end
end

