%kMeansInitCentroids randomly initializes the centroids
%    Centroids = kMeansInitCentroids(X, k) returns k randomly chosen samples
%    from the data-set specified in X

function Centroids = kMeansInitCentroids(X, k)

Centroids = zeros(k, size(X, 2));

randidx = randperm(size(X, 1));
Centroids = X(randidx(1:k), :);

end
