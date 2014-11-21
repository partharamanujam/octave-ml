%predictByLinearGradDesc returns the predicted hypothesis for the
%input-features using previously computed polynomial degree and theta
%    p = predictByLinearGradDesc(x, mu, sigma, degree, theta) returns the
%    predicted value for the provided input-features in x via previously computed
%    mean in mu, standard-deviation in sigma, polynomial degree, and 
%    theta-coefficients in theta
%    Note: This routine explicitly adds the bias-term before computation

function p = predictByLinearGradDesc(x, mu, sigma, degree, theta)

xPoly = generateFeaturesPolynomial(x, degree);
xPolyNormBias = addBiasTerm(scaleFeatures(xPoly, mu, sigma));
p = xPolyNormBias * theta;

end