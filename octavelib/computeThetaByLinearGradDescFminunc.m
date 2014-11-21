%computeThetaByLinearGradDescFminunc returns the theta-coefficients to fit the
%input-features to the outputs
%    theta = computeThetaByLinearGradDescFminunc(X, y, lambda) returns the
%    theta-coefficients to fit the input-features in X to the outputs
%    in y using the regularization-parameter lambda using Linear Regression
%    via Gradient Descent implemented by fminunc
%    Note: This routine does "not" add the bias-term

function theta = computeThetaByLinearGradDescFminunc(X, y, lambda)

initialTheta = zeros(size(X, 2), 1);
costFunction = @(t) linearRegressionCostFunction(X, y, t, lambda);
options = optimset('MaxIter', 200, 'GradObj', 'on');
theta = fminunc(costFunction, initialTheta, options);

end