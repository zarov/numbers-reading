function [ pbelonging ] = computepdistances( centerslearning, vectordistance, d)
 % COMPUTEPDISTANCES Compute probabilities of belonging according to
% distances
%    PBELONGING = COMPUTEPDISTANCES(CENTERSLEARNING,
%    VECTORDISTANCE, D)
    pbelonging = zeros(10, 1);
    distances = [   sum(abs(centerslearning(1, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(2, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(3, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(4, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(5, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(6, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(7, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(8, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(9, 1:2*d) - vectordistance));
                    sum(abs(centerslearning(10, 1:2*d) - vectordistance))];
     for i = 1:10
         pbelonging(i) = exp(-1*distances(i))/sum(exp(-1*distances));         
     end
end

