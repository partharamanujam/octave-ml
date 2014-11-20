%computeThetaByNormalEquation returns the theta-coefficients to fit the
%input-features to the outputs
%    theta = computeThetaByNormalEquation(X, y, n) returns the 
%    theta-coefficients to fit the input-features in X to the outputs
%    in y using a polynomial of degree n
%    Note: This routine explicitly adds the bias-term before computation


function theta = computeThetaByNormalEquation(X, y, n)

XPolyBias = addBiasTerm(generateFeaturesPolynomial(X, n));
theta = pinv(XPolyBias'*XPolyBias)*XPolyBias'*y;

end