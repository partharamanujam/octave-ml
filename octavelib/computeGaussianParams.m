%computeGaussianParams returns the Gaussian parameters mean and
%variance for the provided input features
%    [mu, sigma2] = computeGaussianParams(X) computes the Gaussian
%    parameters mu (mean) and variance (sigma^2) for the provided
%    input features in X

function [mu, sigma2] = computeGaussianParams(X)

mu = mean(X);
sigma2 = var(X, 1);

end