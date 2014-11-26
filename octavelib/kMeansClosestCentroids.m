%kMeansClosestCentroids computes the centroid memberships for the data-set
%    idx = kMeansClosestCentroids(X, Centroids) returns the
%    centroid memberships vector for the data-set specified
%    in X based on provided Centroids

function idx = kMeansClosestCentroids(X, Centroids)

k = size(Centroids, 1);
m = size(X, 1);
idx = zeros(m, 1);
dist = zeros(m, k);

for i=1:k

    CentroidMatrix = repmat(Centroids (i, :), m, 1);
    dist(:, i) = sum((X .- CentroidMatrix) .^ 2, 2);

end

[val, idx] = min(dist, [], 2);

end