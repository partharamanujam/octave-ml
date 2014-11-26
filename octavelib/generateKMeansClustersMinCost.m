%generateKMeansClustersMinCost computes the Centroids and data-set
%assignments using multiple random-initializations to minimize cost
%    [Centroids, idx, cost] = generateKMeansClustersMinCost(X, k, ri, iters)
%    returns the computed cluster Centroids, mapping vector, and cost for the
%    data-set specified in X based on count in k running for max iterations,
%    minimizing the cost/distortion by running k-means with ri number of
%    random-initializations

function [Centroids, idx, cost] = generateKMeansClustersMinCost(X, k, ri, max)

for count=1:ri
    [TCentroids, tidx] = generateKMeansClusters(X, k, max);
    tcost = kMeansCostFunction(TCentroids, X, tidx);
    if ~exist('cost', 'var') || (tcost < cost)
        cost = tcost;
        Centroids = TCentroids;
        idx = tidx;
    end
end

end