%computeCoFiParamsByGradDescFmincg returns the parameters to fit the
%ratings to the users using regularization
%    [X, Theta] = computeCoFiParamsByGradDescFmincg(Y, R, numFeatures, lambda)
%    returns the collaborative-filtering parameters X and Theta to fit the 
%    ratings in Y and R for the provided number of features and regulation
%    parameter lambda via Gradient Descent implemented by fmincg
function [X, Theta] = computeCoFiParamsByGradDescFmincg(Y, R, numFeatures, lambda)

[numMovies, numUsers] = size(Y);

% random init
X = randn(numMovies, numFeatures);
Theta = randn(numUsers, numFeatures);

% wrap params
initialParams = [X(:); Theta(:)];

costFunction = @(p) collaborativeFilteringCostFunction(p, Y, R, numFeatures, lambda);
options = optimset('MaxIter', 100, 'GradObj', 'on');
warning('off', 'Octave:possible-matlab-short-circuit-operator', 'local');
do_braindead_shortcircuit_evaluation(1, 'local');
params = fmincg(costFunction, initialParams, options);

% un-wrap params
X = reshape(params(1:numMovies*numFeatures), numMovies, numFeatures);
Theta = reshape(params(numMovies*numFeatures+1:end), numUsers, numFeatures);

end