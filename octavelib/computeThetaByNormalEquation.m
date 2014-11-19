function [theta] = computeThetaByNormalEquation(X, n, y)

XPolyBias = addBiasTerm(generateFeaturesPolynomial(X, n));
theta = pinv(XPolyBias'*XPolyBias)*XPolyBias'*y;

end