%chooseRBFParamsForSVM returns the training parameters for RBF-kernel
%which best fits the provided input-features (training-set) when checked
%againt the provided validation-set
%    [C, gamma] = chooseRBFParamsForSVM(Xtrain, ytrain, Xval, yval)
%    computes the C and gamma parameters which best fit the provided
%    training-set as Xtrain and ytrain by comparing the results against
%    the provided validation-set as Xval and yval using RBF-kernel
%    in SVM (RBF-kernel is similar to Gaussian-kerenl)
function [C, gamma] = chooseRBFParamsForSVM(Xtrain, ytrain, Xval, yval)

[a b] = ndgrid([0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]);
perms = [a(:) b(:)];
permsize = size(perms, 1);
maxacc = 0.0;
permidx = 1;
C = 0.0;
gamma = 0.0;

for idx=1:permsize

    C = perms(idx,1);
	gamma = perms(idx,2);
    % SVM training
    % -s 0 : classification
    % -t 2 : RBF/Gaussina kernel
    % -c number : C
    % -g number : gamma
	model = svmtrain(ytrain, Xtrain, sprintf('-s 0 -t 2 -c %g -g %g', C, gamma));
	[pred, acc, prob] = svmpredict(yval, Xval, model);
	
    if (idx == 1) || (acc(1) > maxacc)
        maxacc = acc(1);
		permidx = idx;
    endif

end

C = perms(permidx, 1);
gamma = perms(permidx, 2);

end