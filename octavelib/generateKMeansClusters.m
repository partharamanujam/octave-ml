%generateKMeansClusters computes the Centroids and data-set assignments
%    [Centroids, idx] = generateKMeansClusters(X, k, iters) returns the
%    computed cluster Centroids for the data-set specified in X based
%    on count in k running for max iterations

function [Centroids, idx] = generateKMeansClusters(X, k, max)

[m n] = size(X);
idx = zeros(m, 1);
Centroids = zeros(k, n);

Centroids = kMeansInitCentroids(X, k);

for i=1:max

    idx = kMeansClosestCentroids(X, Centroids);
    Centroids = kMeansComputeCentroids(X, idx, k);

end

end