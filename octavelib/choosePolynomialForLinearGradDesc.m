%choosePolynomialForLinearGradDesc returns the degree of the polynomial
%which best fits the provided input-features (training-set) when checked
%againt the provided validation-set
%    degree = choosePolynomialForLinearGradDesc(Xtrain, ytrain, Xval, yval, n)
%    computes the degree of the polynomial which best fits the provided
%    training-set as Xtrain and ytrain by comparing the results against
%    the provided validation-set as Xval and yval from the range of values
%    from 1:n
%    Note: This routine explicitly adds the bias-term before computation

function degree = choosePolynomialForLinearGradDesc(Xtrain, ytrain, Xval, yval, n)

degree = 1;
errorTrain = zeros(n,1);
errorVal = zeros(n,1);

for idx=1:n

    theta = computeThetaByLinearGradDescFminunc(Xtrain, ytrain, idx, 0);
    % training-set
    XtrainPoly = generateFeaturesPolynomial(Xtrain, idx);
    [mu, sigma] = computeScalingParams(XtrainPoly);
    XtrainPolyNormBias = addBiasTerm(scaleFeatures(XtrainPoly, mu, sigma));
    % validation-set
    XvalPoly = generateFeaturesPolynomial(Xval, idx);
    XvalPolyNormBias = addBiasTerm(scaleFeatures(XvalPoly, mu, sigma));
    % calculate error
    errorTrain(idx) = linearRegressionCostFunction(XtrainPolyNormBias, ytrain, theta, 0);
    errorVal(idx) = linearRegressionCostFunction(XvalPolyNormBias, yval, theta, 0);

end

%plot(1:n, errorTrain, 1:n, errorVal);
%title("Plot for Polynomial Degree");
%legend('Train', 'Validation')
%xlabel('Degree');
%ylabel('Error');
%fprintf('Program paused. Press enter to continue.\n');
%pause;

[error, degree] = min(errorVal); 

end