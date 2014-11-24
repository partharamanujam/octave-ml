%computeThetaByNormalEquation returns the theta-coefficients to fit the
%input-features to the outputs
%    theta = computeThetaByNormalEquation(X, y) returns the 
%    theta-coefficients to fit the input-features in X to the outputs in y
%    Note: This routine does "not" add the bias-term

function theta = computeThetaByNormalEquation(X, y)

theta = pinv(X'*X)*X'*y;

end