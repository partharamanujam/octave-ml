%choosePolynomialForLinearGradDesc returns the degree of the polynomial
%which best fits the provided input-features (training-set) when checked
%againt the provided validation-set
%    degree = choosePolynomialForLinearGradDesc(Xtrain, ytrain, Xval, yval, n)
%    computes the degree of the polynomial which best fits the provided
%    training-set as Xtrain and ytrain by comparing the results against
%    the provided validation-set as Xval and yval from the range of values
%    from 1:max
%    Note: This routine explicitly adds the bias-term before computation

function degree = choosePolynomialForLinearGradDesc(Xtrain, ytrain, Xval, yval, max)

degree = 1;
errorTrain = zeros(max,1);
errorVal = zeros(max,1);

for idx=1:max

    % generate polynomials & scale-features
    XtrainPoly = generateFeaturesPolynomial(Xtrain, idx);
    [mu, sigma] = computeScalingParams(XtrainPoly);
    XtrainPolyNormBias = addBiasTerm(scaleFeatures(XtrainPoly, mu, sigma));
    XvalPoly = generateFeaturesPolynomial(Xval, idx);
    XvalPolyNormBias = addBiasTerm(scaleFeatures(XvalPoly, mu, sigma));
    % calculate error
    theta = computeThetaByLinearGradDescFminunc(XtrainPolyNormBias, ytrain, 0);
    errorTrain(idx) = linearRegressionCostFunction(XtrainPolyNormBias, ytrain, theta, 0);
    errorVal(idx) = linearRegressionCostFunction(XvalPolyNormBias, yval, theta, 0);

end

fprintf('Visualizing polynomial degree...\n');
plot(1:max, errorTrain, 1:max, errorVal);
title("Plot for Polynomial Degree");
legend('Train', 'Validation')
xlabel('Degree');
ylabel('Error');
fprintf('Program paused. Press enter to continue.\n');
pause;

[error, degree] = min(errorVal); 

end