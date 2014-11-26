%kMeansComputeCentroids computes the mean centroids for the data-set
%assigned in clusters
%    Centroids = kMeansComputeCentroids(X, idx, k) returns the
%    computed mean Centroids for the data-set specified in X based
%    on provided clusters grouping in idx, and count in k

function Centroids = kMeansComputeCentroids(X, idx, k)

[m n] = size(X);
Centroids = zeros(k, n);

for i=1:k

    kvec = (idx == i);
    num = sum(kvec);
    Centroids(i, :) = 1/num .* (kvec' * X);

end

end