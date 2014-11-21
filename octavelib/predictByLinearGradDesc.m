function p = predictByLinearGradDesc(x, mu, sigma, degree, theta)

xPoly = generateFeaturesPolynomial(x, degree);
xPolyNormBias = addBiasTerm(scaleFeatures(xPoly, mu, sigma));
p = xPolyNormBias * theta;

end