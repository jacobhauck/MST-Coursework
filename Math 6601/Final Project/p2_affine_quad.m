function [local_nodes, local_weights] = p2_affine_quad(ref_nodes, ref_weights, J, b)
% Compute local nodes and quadrature weights from given reference
% nodes and weights and affine mappings to the target domain
% Parameters
% ----------
%   ref_nodes: (p, 2) array of reference node coordinates
%   ref_weights: (p, 1) array of reference quadrature weights corresponding
%                to the nodes
%   J: (N, 2, 2) array of 2 x 2 linear transformation matrices
%   b: (N, 2) array of offset vectors
%
% Return
% ------
%   local_nodes: (N, p, 2) array of local nodes for each transformation
%   local_weights: (N, p) array of local weights for each transformation

p = size(ref_nodes, 1);
N = size(J, 1);

% Compute local nodes
product = tensorprod(J, ref_nodes, 3, 2);  % (N, 2, p), batch matrix-multiply with tensorprod
local_nodes = product + repmat(reshape(b, N, 2, 1), 1, 1, p);  % (N, 2, p)
local_nodes = permute(local_nodes, [1, 3, 2]);  % (N, p, 2)

% Compute local weights
dets = abs(J(:, 1, 1) .* J(:, 2, 2) - J(:, 1, 2) .* J(:, 2, 1));  % (N, 1, 1), deteriminants
local_weights = reshape(dets, N, 1) * ref_weights';  % (N, p)

end