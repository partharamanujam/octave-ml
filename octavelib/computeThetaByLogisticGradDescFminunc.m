%computeThetaByLogisticGradDescFminunc returns the theta-coefficients to fit
%the input-features to the outputs using regularization for specified label
%    theta = computeThetaByLogisticGradDescFminunc(Xtrain, ytrain, label, lambda)
%    returns the theta-coefficients to fit the input-features in Xtrain
%    to the outputs in ytrain for label using the regularization-parameter
%    lambda using Logistic Regression via Gradient Descent implemented
%    by fminunc
%    Note: This routine does "not" add the bias-term

function theta = computeThetaByLogisticGradDescFminunc(Xtrain, ytrain, label, lambda)

initialTheta = zeros(size(Xtrain, 2), 1);
costFunction = @(t) logisticRegressionCostFunction(Xtrain, (ytrain == label), t, lambda);
options = optimset('MaxIter', 200, 'GradObj', 'on');
theta = fminunc(costFunction, initialTheta, options);

end