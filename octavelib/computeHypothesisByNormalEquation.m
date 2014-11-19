function [h] = computeHypothesisByRegression(x, n, theta)

xPolyBias = addBiasTerm(generateFeaturesPolynomial(x, n));
h = xPolyBias * theta;

end