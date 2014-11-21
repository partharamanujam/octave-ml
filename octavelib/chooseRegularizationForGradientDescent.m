%chooseRegularizationForGradientDescent returns the regularization factor
%which best fits the provided input-features (training-set) when checked
%againt the provided validation-set using a polynomial
%    lambda = chooseRegularizationForGradientDescent(Xtrain, ytrain, Xval, yval, degree)
%    computes the regularization factor lambda which best fits the provided
%    training-set as Xtrain and ytrain by comparing the results against
%    the provided validation-set as Xval and yval using the a polynomial
%    of given degree
%    Note: This routine explicitly adds the bias-term before computation

function lambda = chooseRegularizationForGradientDescent(Xtrain, ytrain, Xval, yval, degree)

lambdaVec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];
n = length(lambdaVec);
errorTrain = zeros(n,1);
errorVal = zeros(n,1);

% training-set
XtrainPoly = generateFeaturesPolynomial(Xtrain, degree);
[mu, sigma] = computeScalingParams(XtrainPoly);
XtrainPolyNormBias = addBiasTerm(scaleFeatures(XtrainPoly, mu, sigma));
% validation-set
XvalPoly = generateFeaturesPolynomial(Xval, degree);
XvalPolyNormBias = addBiasTerm(scaleFeatures(XvalPoly, mu, sigma));

for idx=1:n

    theta = computeThetaByLinearGradDescFminunc(Xtrain, ytrain, degree, lambdaVec(idx));
    errorTrain(idx) = linearRegressionCostFunction(XtrainPolyNormBias, ytrain, theta, 0);
    errorVal(idx) = linearRegressionCostFunction(XvalPolyNormBias, yval, theta, 0);

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