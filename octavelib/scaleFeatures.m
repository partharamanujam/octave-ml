%scaleFeatures returns the matrix after scaling/normalizing the features
%using the provided mean and standard-deviation values
%    Xnorm = scaleFeatures(X, mu, sigma) returns after scaling
%    (normalizing) the features in X using the provided mean mu and and
%    standard-deviation sigma values
%    Note: mu and sigma can be obtained using computeScalingParams

function Xnorm = scaleFeatures(X, mu, sigma)

Xnorm = bsxfun(@minus, X, mu);
Xnorm = bsxfun(@rdivide, Xnorm, sigma);

end