function lambda = chooseRegularizationForGradientDescent(Xtrain, ytrain, Xval, yval)

lambdaVec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];
n = length(lambdaVec);
errorTrain = zeros(n,1);
errorVal = zeros(n,1);

for idx=1:n

    theta = computeThetaByLinearGradDescFminunc(Xtrain, ytrain, lambdaVec(idx));
    errorTrain(idx) = linearRegressionCostFunction(Xtrain, ytrain, theta, 0);
    errorVal(idx) = linearRegressionCostFunction(Xval, yval, theta, 0);

end

%plot(lambdaVec, errorTrain, lambdaVec, errorVal);
%title("Plot for Regularization");
%legend('Train', 'Validation')
%xlabel('Regularization');
%ylabel('Error');
%pause;

[error, idx] = min(errorVal);
lambda = lambdaVec(idx);

end