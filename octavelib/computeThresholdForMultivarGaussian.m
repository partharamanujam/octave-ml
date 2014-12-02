%computeThresholdForMultivarGaussian returns the best Gaussian probablity
%density threshold (epsilon) for provided input features
%    epsilon = computeThresholdForMultivarGaussian(Xval, yval, mu, sigma2)
%    computes the Gaussian probability density functioin threshold (epsilon)
%    using a validation-set, the gaussian parameters mu (mean) and
%    variance (sigma^2) which is optimized for F1-score
function epsilon = computeThresholdForMultivarGaussian(Xval, yval, mu, sigma2)

pval = computeMultivarGaussianDistribution(Xval, mu, sigma2);

epsilon = 0;
f1score = 0;
bestf1score = 0;
stepsize = (max(pval) - min(pval)) / 1000;

for eps = min(pval):stepsize:max(pval)

    cvPredictions = (pval < eps);
    fp = sum((cvPredictions == 1) & (yval == 0));
    fn = sum((cvPredictions == 0) & (yval == 1));
    tp = sum((cvPredictions == 1) & (yval == 1));

    if ((tp == 0) && ((fp == 0) || (fn == 0)))
        continue;
    end
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);

    f1score = 2 * prec * rec / (prec + rec);

    if (f1score > bestf1score)
        bestf1score = f1score;
        epsilon = eps;
    end

end

end