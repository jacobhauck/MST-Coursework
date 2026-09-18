function [J, b] = p2_local_mapping(triangles)
% Construct affine mappings taking the reference triangle to the given
% triangles.
% Parameters
% ----------
%   triangles: (N, 3, 2) array of triangle vertices, first index is
%              triangle number, second index is vertex number, third index
%              is coordinate number (1 = x, 2 = y)
%
% Return
% ------
%   [J, b], the affine mapping is Jx + b for a reference point x.
%   J: (N, 2, 2) array of 2 x 2 linear transformtion matrices
%   b: (N, 2) array of 2 x 1 column vector offsets

N = size(triangles, 1);
b = triangles(:, 2, :);  % (N, 1, 2)
J = triangles(:, [1, 3,], :) - repmat(b, 1, 2, 1);  % (N, 2, 2)
b = reshape(b, N, 2);

end