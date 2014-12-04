%collaborativeFilteringCostFunction computes the cost and gradient in
%training-set for a given theta and lambda using linear regression
%    [J, gradient] = collaborativeFilteringCostFunction(params, Y, R,
%        numFeatures, lambda) computes the cost and gradient for the specified
%    parameters using the ratings in Y and R, given number of features and the
%    regularization parameter lambda
function [J, gradient] = collaborativeFilteringCostFunction(params, Y, R, numFeatures, lambda)

[numMovies, numUsers] = size(Y);

% un-wrap parameters
X = reshape(params(1:numMovies*numFeatures), numMovies, numFeatures);
Theta = reshape(params(numMovies*numFeatures+1:end), numUsers, numFeatures);

% init
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% cost
Prediction = X * Theta';
Error = Prediction - Y;
cost = sum(sum((Error .^ 2) .* R)) / 2;
regfactor = (lambda / 2) * (sum(sumsq(Theta)) + sum(sumsq(X)));
J = cost + regfactor;

% gradient
X_grad = (Error .* R) * Theta + (lambda * X);
Theta_grad = (Error .* R)' * X + (lambda * Theta);

% wrap parameters
gradient = [X_grad(:); Theta_grad(:)];

end