% set-path for octavelib
addpath([pwd() '/../octavelib']);

% load houses pricing-data
data = csvread('prices.csv');
%plot3(data(:, 1), data(:, 2), data(:, 3), 'rx', 'MarkerSize', 5);

% input features are area (sq.ft.) & bedrooms (number)
X = data(:, 1:2);

% out is the price
y = data(:, 3);

% train using normal-equation
theta = computeThetaByNormalEquation(X, y, 1);

% predict price for 1650 sq.ft. with 3 bedrooms
x = [1650 3];
price = predictByNormalEquation(x, 1, theta);
fprintf("Predicted price of a 1650 sq-ft, 3 br house: %.2f\n", price);
