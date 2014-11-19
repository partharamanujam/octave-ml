%generateFeaturesPolynomial returns the matrix with nth-degree polynomials
%using the rows of the input matrix
%    Xpoly = generateFeaturesPolynomial(X, n) returns a matrix with nth-degree
%    polynomial using each of the rows of the input matrix X, where each row
%    represents input features

function Xpoly = generateFeaturesPolynomial(X, n)

Xpoly = X;

for idx = 2:n

     Xpoly = [Xpoly multinom(X, idx, "ascend")];

end

end