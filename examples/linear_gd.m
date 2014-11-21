% set-path for octavelib
addpath([pwd() '/../octavelib']);

% data: change in water-level (x) vs. water flowing out (y)
% load X, y, Xval, yval, Xtest, ytest in environment
load('damlevels.mat');
%plot(X, y, 'bx', 'MarkerSize', 5, 'LineWidth', 1.5);
%hold on;
%plot(Xval, yval, 'gx', 'MarkerSize', 5, 'LineWidth', 1.5);
%plot(Xtest, ytest, 'rx', 'MarkerSize', 5, 'LineWidth', 1.5);
%legend('Training', 'Validation', 'Test');
%xlabel('Change in water level (x)');
%ylabel('Water flowing out of the dam (y)');
%hold off;
%pause;

% choose polynomial degree
degree = choosePolynomialForGradientDescent(X, y, Xval, yval, 10);

% generate polynomial features for training-set, validation-set, and test-set
XPoly = generateFeaturesPolynomial(X, degree);
[mu, sigma] = computeScalingParams(XPoly);
XPolyNormBias = addBiasTerm(scaleFeatures(XPoly, mu, sigma));
XvalPoly = generateFeaturesPolynomial(Xval, degree);
XvalPolyNormBias = addBiasTerm(scaleFeatures(XvalPoly, mu, sigma));
XtestPoly = generateFeaturesPolynomial(Xtest, degree);
XtestPolyNormBias = addBiasTerm(scaleFeatures(XtestPoly, mu, sigma));

% choose regulaization factor
lambda = chooseRegularizationForGradientDescent(XPolyNormBias, y, XvalPolyNormBias, yval, degree);

% compute theta
theta = computeThetaByLinearGradDescFminunc(XPolyNormBias, y, lambda);

% predict water flow when level is at 30
x = [30];
level = predictByLinearGradDesc(x, mu, sigma, degree, theta);
fprintf("Predicted water-flow at level %.3f is %.3f\n", x(1), level);

% plot prediction error (cost) versus test-set
prediction = (theta' * XtestPolyNormBias')';
plot(Xtest, ytest, 'gx', 'MarkerSize', 5, 'LineWidth', 1.5);
hold on;
plot(Xtest, prediction, 'bx', 'MarkerSize', 5, 'LineWidth', 1.5);
legend('Test', 'Prediction');
title('Test-data VS Predicted-data');
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold off;
