function triangles = p2_triangles(n)
% Get a list of triangles in the mesh of size n x n
% Parameters
% ----------
%   n: number of squares in the mesh, each of which is partitioned into
%      two triangles.
%
% Return
% ------
%   triangles: (2n^2, 3, 2) array of triangle vertex coordinates. First
%              index is triangle number, second is vertex number, third is
%              coordinate index (1 = x, 2 = y)

triangles = zeros(2*n^2, 3, 2);

k = 1;
for i = 1:n
    for j = 1:n
        % Consider square [(i-1)/n, i/n] x [(j-1)/n, j/n]
        
        % Lower-right triangle
        triangles(k, 1, :) = [(i-1)/n, (j-1)/n];
        triangles(k, 2, :) = [i/n, (j-1)/n];
        triangles(k, 3, :) = [i/n, j/n];
        k = k + 1;
        
        % Upper-left triangle
        triangles(k, 1, :) = [(i-1)/n, (j-1)/n];
        triangles(k, 2, :) = [i/n, j/n];
        triangles(k, 3, :) = [(i-1)/n, j/n];
        k = k + 1;
    end
end