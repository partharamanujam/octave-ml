% set-path for octavelib and clear
addpath([pwd() '/../octavelib']);
clear ; close all; clc;

% dataset containing historical records on the change in the water level, x,
% and the amount of water owing out of the dam, y.
% This dataset is divided into three parts:
% 1. A training set that your model will learn on: X, y
% 2. A cross validation set for determining the regularization parameter: Xval, yval
% 3. A test set for evaluating performance: Xtest, ytest

% load data
load('damlevels.mat');
fprintf('Visualizing data...\n');
plot(X, y, 'bx', 'MarkerSize', 5, 'LineWidth', 1.5);
hold on;
plot(Xval, yval, 'gx', 'MarkerSize', 5, 'LineWidth', 1.5);
plot(Xtest, ytest, 'rx', 'MarkerSize', 5, 'LineWidth', 1.5);
legend('Training', 'Validation', 'Test');
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold off;
fprintf('Program paused. Press enter to continue.\n');
pause;

% choose polynomial degree
degree = choosePolynomialForLinearGradDesc(X, y, Xval, yval, 10);

% generate corresponding polynomials & scale-features
XPoly = generateFeaturesPolynomial(X, degree);
[mu, sigma] = computeScalingParams(XPoly);
XPolyNormBias = addBiasTerm(scaleFeatures(XPoly, mu, sigma));
XvalPoly = generateFeaturesPolynomial(Xval, degree);
XvalPolyNormBias = addBiasTerm(scaleFeatures(XvalPoly, mu, sigma));
XtestPoly = generateFeaturesPolynomial(Xtest, degree);
XtestPolyNormBias = addBiasTerm(scaleFeatures(XtestPoly, mu, sigma));

% choose regulaization factor
lambda = chooseRegularizationForLinearGradDesc(XPolyNormBias, y, XvalPolyNormBias, yval)

% compute theta
theta = computeThetaByLinearGradDescFminunc(XPolyNormBias, y, lambda);

% predict water flow at level 30
x = [30];
xPoly = generateFeaturesPolynomial(x, degree);
xPolyNormBias = addBiasTerm(scaleFeatures(xPoly, mu, sigma));
level = predictByLinearGradDesc(xPolyNormBias, theta);
fprintf("Predicted water-flow at level %.3f is %.3f\n", x(1), level);


% plot prediction error (cost) versus test-set
prediction = XtestPolyNormBias*theta;
plot(Xtest, ytest, 'gx', 'MarkerSize', 5, 'LineWidth', 1.5);
hold on;
plot(Xtest, prediction, 'bx', 'MarkerSize', 5, 'LineWidth', 1.5);
legend('Test', 'Prediction');
title('Test-data VS Predicted-data');
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold off;
