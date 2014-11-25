%logisticRegressionOneVsAllError computes the error in prediction
%for a given Theta
%    error = logisticRegressionOneVsAllError(X, y, Theta) computes
%    the error in prediction for the input-features X and outputs y, given a
%    specific mapping-parameters Theta using One-Versus-All Logistic Regression
%    Note: This routine does "not" add the bias-term

function error = logisticRegressionOneVsAllError(X, y, Theta)

error = 0;

[val, idx] = max(X * Theta', [], 2);
error = sum(idx != y)/size(y,1);

end