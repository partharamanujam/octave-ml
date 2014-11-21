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

% calculate corresponding mu and sigma
XPoly = generateFeaturesPolynomial(X, degree);
[mu, sigma] = computeScalingParams(XPoly);

% choose regulaization factor
lambda = chooseRegularizationForGradientDescent(X, y, Xval, yval, degree);

% compute theta
theta = computeThetaByLinearGradDescFminunc(X, y, degree, lambda);

% predict water flow at level 30
x = [30];
level = predictByLinearGradDesc(x, mu, sigma, degree, theta);
fprintf("Predicted water-flow at level %.3f is %.3f\n", x(1), level);

% generate polynomial features for test-set
XtestPoly = generateFeaturesPolynomial(Xtest, degree);
XtestPolyNormBias = addBiasTerm(scaleFeatures(XtestPoly, mu, sigma));

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
