%recoverPCAData recovers the approximate data-representation of the original
%data from projected-data
%    XRec = recoverPCAData(Z, U, k) returns the approximate data-representation
%    of the original input-features by projecting back Z on the first k
%    eigen-vectors from U

function XRec = recoverPCAData(Z, U, k)

XRec = zeros(size(Z, 1), size(U, 1));
Ureduce = U(:, 1:k);

for i=1:size(Z,1)

    XRec(i, :) = Ureduce * Z(i, :)';

end

end