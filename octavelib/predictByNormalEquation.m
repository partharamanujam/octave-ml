%predictByNormalEquation returns the predicted hypothesis for the
%input-features using previously computed theta
%    p = predictByNormalEquation(x, n, theta) returns the predicted
%    value for the provided input-features in x via previously computed
%    theta-coefficients in theta using a polynomial of degree n
%    Note: This routine explicitly adds the bias-term before computation

function p = predictByNormalEquation(x, n, theta)

xPolyBias = addBiasTerm(generateFeaturesPolynomial(x, n));
p = xPolyBias * theta;

end