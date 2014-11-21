%computeScalingParams returns the scaling/normalizing parameters mu and sigma
%for the provided input features
%    [mu, sigma] = computeScalingParams(X) computes the scaling/normalizing
%    parameters mu and sigma for the provided input features in X
%    Note: mu and sigma can be used with scaleFeatures

function [mu, sigma] = computeScalingParams(X)

mu = mean(X);
Xmu = bsxfun(@minus, X, mu);
sigma = std(Xmu);

end