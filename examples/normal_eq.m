%init
initEnv();

% The first column is the size of the house (in square feet), the
% second column is the number of bedrooms, and the third column is
% the price of the house.

% load data
data = csvread('prices.csv');
X = data(:, 1:2);
y = data(:, 3);
fprintf('Visualizing data...\n');
plot3(data(:, 1), data(:, 2), data(:, 3), 'rx', 'MarkerSize', 5);
fprintf('Program paused. Press enter to continue.\n');
pause;

% assume 1st-degree polynomial & no feature scaling/normaization
degree = 1;
XPolyBias = addBiasTerm(generateFeaturesPolynomial(X, degree));

% train using normal-equation
theta = computeThetaByNormalEquation(XPolyBias, y, degree);

% predict price for 1650 sq.ft. with 3 bedrooms
x = [1650 3];
xPolyBias = addBiasTerm(generateFeaturesPolynomial(x, degree));
price = predictByNormalEquation(xPolyBias, theta);
fprintf("Predicted price of a 1650 sq-ft, 3 br house: %.2f\n", price);
