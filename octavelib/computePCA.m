%computePCA performs Principal Component Analysis on data-set
%    [U, S] = computePCA(X) returns the eigenvectors in U and the eigenvalues
%    (on diagonal) in S of the covariance matrix of X 

function [U, S] = computePCA(X)

[m, n] = size(X);
U = zeros(n);
S = zeros(n);

Sigma = 1/m .* X' * X;
[U, S, V] = svd(Sigma);

end