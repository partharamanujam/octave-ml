%predictByLinearGradDesc returns the predicted hypothesis for the
%input-features using previously computed theta
%    p = predictByLinearGradDesc(x, theta) returns the predicted value
%    for the provided input-features in x using previously computed
%    theta-coefficients in theta
%    Note: This routine does "not" add the bias-term

function p = predictByLinearGradDesc(x, theta)

p = x * theta;

end