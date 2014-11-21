%linearRegressionCostFunction computes the cost and gradient in training-set
%for a given theta and lambda
%    [J, gradient] = linearRegressionCostFunction(X, y, theta, lambda) computes
%    the cost and gradient for the input-features X and outputs y, given a
%    specific mapping-parameters theta and regularization parameter lambda
%    Note: This routine does "not" add the bias-term

function [J, gradient] = linearRegressionCostFunction(X, y, theta, lambda)

m = length(y);
J = 0;
gradient = zeros(size(theta));

prediction = (theta' * X')';
cost = sum((prediction - y) .^ 2)/(2*m);
regfactor = lambda/(2*m) * (sum(theta .^ 2) - theta(1)^2);
J = cost + regfactor;

gradient = (1/m .* (X' * (prediction .- y))) .+ (lambda/m * theta);
gradient(1) = gradient(1) - (lambda/m * theta(1));
gradient = gradient(:);

end