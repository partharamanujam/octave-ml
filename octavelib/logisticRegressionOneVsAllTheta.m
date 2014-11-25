%logisticRegressionOneVsAllTheta computes the Theta matrix to fit the
%input-features to the outputs using the provided labels and regularization
%    AllTheta = logisticRegressionOneVsAllTheta(Xtrain, ytrain, lambda)
%    computes the Theta matrix for the input-features Xtrain, outputs ytrain,
%    and lablels given the regularization lambda using One-Versus-All
%    Logistic Regression
%    Note: This routine does "not" add the bias-term

function AllTheta = logisticRegressionOneVsAllTheta(Xtrain, ytrain, labels, lambda)

numLabels = length(labels);
AllTheta = zeros(numLabels, size(Xtrain, 2));

for idx=1:numLabels

    th = computeThetaByLogisticGradDescFminunc(Xtrain, ytrain, labels(idx), lambda);
    AllTheta(idx, :) = th';

end

end