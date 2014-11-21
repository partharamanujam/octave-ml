function degree = choosePolynomialForGradientDescent(Xtrain, ytrain, Xval, yval, n)

degree = 1;
errorTrain = zeros(n,1);
errorVal = zeros(n,1);

for idx=1:n

    % training-set
    XtrainPoly = generateFeaturesPolynomial(Xtrain, idx);
    [mu, sigma] = computeScalingParams(XtrainPoly);
    XtrainPolyNormBias = addBiasTerm(scaleFeatures(XtrainPoly, mu, sigma));
    theta = computeThetaByLinearGradDescFminunc(XtrainPolyNormBias, ytrain, 0);
    errorTrain(idx) = linearRegressionCostFunction(XtrainPolyNormBias, ytrain, theta, 0);
    % validation-set
    XvalPoly = generateFeaturesPolynomial(Xval, idx);
    XvalPolyNormBias = addBiasTerm(scaleFeatures(XvalPoly, mu, sigma));
    errorVal(idx) = linearRegressionCostFunction(XvalPolyNormBias, yval, theta, 0);

end

%plot(1:n, errorTrain, 1:n, errorVal);
%title("Plot for Polynomial Degree");
%legend('Train', 'Validation')
%xlabel('Degree');
%ylabel('Error');
%pause;

[error, degree] = min(errorVal); 

end