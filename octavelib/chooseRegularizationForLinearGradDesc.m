%chooseRegularizationForLinearGradDesc returns the regularization factor
%which best fits the provided input-features (training-set) when checked
%againt the provided validation-set
%    lambda = chooseRegularizationForLinearGradDesc(Xtrain, ytrain, Xval, yval)
%    computes the regularization factor lambda which best fits the provided
%    training-set as Xtrain and ytrain by comparing the results against
%    the provided validation-set as Xval and yval
%    Note: This routine does "not" add the bias-term

function lambda = chooseRegularizationForLinearGradDesc(Xtrain, ytrain, Xval, yval)

lambdaVec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];
lambdaVecLen = length(lambdaVec);
errorTrain = zeros(lambdaVecLen,1);
errorVal = zeros(lambdaVecLen,1);

for idx=1:lambdaVecLen

    theta = computeThetaByLinearGradDescFminunc(Xtrain, ytrain, lambdaVec(idx));
    errorTrain(idx) = linearRegressionCostFunction(Xtrain, ytrain, theta, 0);
    errorVal(idx) = linearRegressionCostFunction(Xval, yval, theta, 0);

end

fprintf('Visualizing regularization factor...\n');
plot(lambdaVec, errorTrain, lambdaVec, errorVal);
title("Plot for Regularization");
legend('Train', 'Validation')
xlabel('Regularization');
ylabel('Error');
fprintf('Program paused. Press enter to continue.\n');
pause;

[error, idx] = min(errorVal);
lambda = lambdaVec(idx);

end