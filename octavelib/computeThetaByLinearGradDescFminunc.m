%computeThetaByLinearGradDescFminunc returns the theta-coefficients to fit the
%input-features to the outputs using regularization
%    theta = computeThetaByLinearGradDescFminunc(Xtrain, ytrain, lambda) returns
%    the theta-coefficients to fit the input-features in X to the outputs
%    in y using the regularization-parameter lambda using Linear Regression
%    via Gradient Descent implemented by fminunc
%    Note: This routine does "not" add the bias-term

function theta = computeThetaByLinearGradDescFminunc(Xtrain, ytrain, lambda)

initialTheta = zeros(size(Xtrain, 2), 1);
costFunction = @(t) linearRegressionCostFunction(Xtrain, ytrain, t, lambda);
options = optimset('MaxIter', 200, 'GradObj', 'on');
theta = fminunc(costFunction, initialTheta, options);

end