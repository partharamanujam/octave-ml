%init
initEnv();

%  Loads the dataset - adds X, Xval, yval to environment
load('anomaly.dat');

% compute gaussian parameters
[mu sigma2] = computeGaussianParams(X);

% compute epsilon/threshold for probablity using validation-set
epsilon = computeThresholdForMultivarGaussian(Xval, yval, mu, sigma2);

% compute multivariate Guassian distribution probablity
probability = computeMultivarGaussianDistribution(X, mu, sigma2);

% count of outliers
fprintf("Number of outliers found: %d\n", sum(probability < epsilon));