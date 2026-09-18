function integral = p2_quad_full(f, n, ref_nodes, ref_weights)
% Compute the integral of f over (0,1)^2 using a triangle mesh of size 
% n x n with the given reference quadrature nodes and weights.
% Parameters
% ----------
%   f: (N, 2) -> (N, c) callable giving the values of f (possibly
%      vector-valued with c components)
%   n: number of *squares* in the mesh in each direction
%   ref_nodes: (p, 2) coordinates of reference quadrature nodes
%   ref_weights: (p, 1) reference quadrature weights
%
% Return
% ------
%   integral: (c, 1) the approximate integral of f over (0,1)^2

triangles = p2_triangles(n);
[J, b] = p2_local_mapping(triangles);
[local_nodes, local_weights] = p2_affine_quad(ref_nodes, ref_weights, J, b);
local_nodes = reshape(local_nodes, size(local_nodes, 1) * size(local_nodes, 2), size(local_nodes, 3));  % (2pn^2, 2)
local_weights = reshape(local_weights, 1, numel(local_weights));  % (1, 2pn^2)
integral = local_weights * f(local_nodes);  % note that f(local_nodes) is shape (2pn^2, c)
integral = integral';

end