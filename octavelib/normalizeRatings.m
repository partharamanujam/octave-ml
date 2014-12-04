%normalizeRatings returns the rows normalized by mean and the mean parameters
%for each row
%    [YNorm, yMean] = normalizeRatings(Y, R) computes the normalized rows in Y
%    Y using the mean and returns the mean-normalized rows along with the
%    mean-parameters for each of the rows only for valid ratings present in R

function [YNorm, yMean] = normalizeRatings(Y, R)

[m, n] = size(Y);
YNorm = zeros(m, n);
yMean = zeros(m, 1);

for i=1:m

    idx = find(R(i, :) == 1);
    yMean(i) = mean(Y(i, idx));
    YNorm(i, idx) = Y(i, idx) - yMean(i);

end

end