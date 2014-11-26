%kMeansCostFunction computes the cost (distortion) of Centroids for a given
%data-set and their assignments
%    cost = kMeansCostFunction(Centroids, X, idx) computes the cost of
%    the Centroids for a given data-set in X, and ther assigments in idx

function cost = kMeansCostFunction(Centroids, X, idx)

[m n] = size(X);
Mu = Centroids(idx, :);
cost = 0.0;

for i=1:m

    cost = cost + (norm(X(i) - Mu(i)) ^ 2);

end

cost = cost/m;

end