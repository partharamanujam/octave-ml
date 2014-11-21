%computeThetaByLinearGradDescFminunc returns the theta-coefficients to fit the
%input-features to the outputs using a polynomial and regularization
%    theta = computeThetaByLinearGradDescFminunc(X, y, degree, lambda) returns
%    the theta-coefficients to fit the input-features in X to the outputs
%    in y using the regularization-parameter lambda and a polynomial of
%    specified degree using Linear Regression via Gradient Descent implemented
%    by fminunc
%    Note: This routine explicitly adds the bias-term before computation

function theta = computeThetaByLinearGradDescFminunc(X, y, degree, lambda)

XPoly = generateFeaturesPolynomial(X, degree);
[mu, sigma] = computeScalingParams(XPoly);
XPolyNormBias = addBiasTerm(scaleFeatures(XPoly, mu, sigma));

initialTheta = zeros(size(XPolyNormBias, 2), 1);
costFunction = @(t) linearRegressionCostFunction(XPolyNormBias, y, t, lambda);
options = optimset('MaxIter', 200, 'GradObj', 'on');
theta = fminunc(costFunction, initialTheta, options);

end