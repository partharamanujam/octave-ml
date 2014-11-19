%addBiasTerm returns the matrix after adding the bias-term of 1 to each of the
%rows of the input matrix
%    Xbias = addBiasTerm(X) returns a matrix with added bias-term of 1 to
%    each of the rows of the input matrix X, where each row represents input
%    features

function Xbias = addBiasTerm(X)

Xbias = [ones(size(X, 1), 1) X];

end