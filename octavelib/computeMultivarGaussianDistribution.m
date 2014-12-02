%computeMultivarGaussianDistribution returns the multi-variate Gaussian
%probablity density for provided input features
%    prob = computeMultivarGaussianDistribution(X, mu, sigma2) computes
%    the Gaussian probability density functioin for the provided
%    input features in X using the provided parameters mu (mean)
%    and variance (sigma^2) 

function p = computeMultivarGaussianDistribution(X, mu, sigma2)

k = length(mu);

if (size(sigma2, 2) == 1) || (size(sigma2, 1) == 1)
    sigma2 = diag(sigma2);
end

X = bsxfun(@minus, X, mu(:)');
p = (2 * pi) ^ (- k / 2) * det(sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(sigma2), X), 2));

end