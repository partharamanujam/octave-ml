%logisticRegressionCostFunction computes the cost and gradient in training-set
%for a given theta and lambda using logistic regression
%    [J, gradient] = linearRegressionCostFunction(X, y, theta, lambda) computes
%    the cost and gradient for the input-features X and outputs y, given a
%    specific mapping-parameters theta and regularization parameter lambda
%    Note: This routine does "not" add the bias-term

function [J, gradient] = logisticRegressionCostFunction(X, y, theta, lambda)

m = length(y);
J = 0;
gradient = zeros(size(theta));

prediction = sigmoid(X*theta);
cost = -((y' * log(prediction)) + ((1 .- y') * log(1 .- prediction)))/m;
regfactor = lambda/(2*m) * (sum(theta(2:end) .^ 2));
J = cost + regfactor;

temp = theta;
temp(1) = 0;
gradient = (1/m .* (X' * (prediction .- y))) .+ (lambda/m * temp);
gradient = gradient(:);

end