%projectPCAData computes the reduced data-representation and the corresponding
%variance for the selected top eigen-vectors
%    Z = projectPCAData(X, U, k) returns the reduced data-representation
%    of input-features from X, and the corrresponding variance by projecting
%    them on the first k eigen-vectors from U

function [Z, variance] = projectPCAData(X, U, S, k)

Z = zeros(size(X, 1), k);
variance = 0.0;

Ureduce = U(:, 1:k);
Z = X * Ureduce;

s = diag(S);
variance = sum(s(1:k))/sum(s);

end