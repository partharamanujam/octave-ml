%predictByLogisticGradDescOneVsAll returns the predicted label for the
%input-features using previously computed AllTheta matrix
%    label = predictByLogisticGradDescOneVsAll(x, AllTheta) returns the
%    predicted lable for the provided input-features in x using previously
%    computed theta-coefficients matrix in AllTheta using One-Versus-All
%    Note: This routine does "not" add the bias-term

function label = predictByLogisticGradDescOneVsAll(x, AllTheta)

[val, label] = max(x * AllTheta', [], 2);

end