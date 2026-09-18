function [ref_nodes, ref_weights] = p2_gauss4()
% Construct 4-point Gaussian quadrature nodes and weights for the
% reference triangle.
% Return
% ------
%   [ref_nodes, ref_weights]
%   ref_nodes: (4, 2) coordinates of the reference nodes
%   ref_weights: (4, 1) reference weights

% Points for Gaussian quadrature on [-1,1]
x0h = -1/sqrt(3);
x1h = 1/sqrt(3);

% Build reference nodes
ref_nodes = [
    (1 + x0h)/2, (1-x0h) * (1+x0h) / 4;  % (x_{00}, y_{00})
    (1 + x0h)/2, (1-x0h) * (1+x1h) / 4;  % (x_{10}, y_{10})
    (1 + x1h)/2, (1-x1h) * (1+x0h) / 4;  % (x_{01}, y_{01})
    (1 + x1h)/2, (1-x1h) * (1+x1h) / 4  % (x_{11}, y_{11})
];

% Build reference weights
ref_weights = [
    (1 - x0h)/8;  % w_{00}
    (1 - x0h)/8;  % w_{10}
    (1 - x1h)/8;  % w_{01}
    (1 - x1h)/8;  % w_{11}
];

end