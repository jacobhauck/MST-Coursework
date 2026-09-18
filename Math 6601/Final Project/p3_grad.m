function grad = p3_grad(value, g_value, cos_value, sin_value, theta)
% Compute the gradient of the discretized loss L_m using the given nodes
% Parameters
% ----------
%   value: (m, 1) model output value at the m node points
%   g_value: (m, 1) true function output value at the m node points
%   cos_value: (m, n) matrix whose ij element is cos(w_jt_i + b_j)
%   sin_value: (m, n) matrix whose ij element is sin(w_jt_i + b_j)
%   theta: (3n, 1) vector of parameter values packed as theta = [c, w, b]
% 
% Return
% ------
%   grad: (3n, 1) gradient of L_m w.r.t. theta, packed in the same order as
%         theta

% Get n and parameters
if mod(length(theta), 3) ~= 0
    error('Invalid parameter vector');
end
n = length(theta) / 3;
m = length(value);

c = theta(1:n, 1);

% Compute gradient
t = p3_t(m);  % (m, 1)
diff = value - g_value;  % (m, 1)
grad_c = (2/m) * (cos_value' * diff);  % (n, 1)
grad_w = ((-2/m)*c) .* (sin_value' * (diff .* t));  % (n, 1)
grad_b = ((-2/m)*c) .* (sin_value' * diff);  % (n, 1)

grad = zeros(3*n, 1);
grad(1:n, :) = grad_c;
grad((n+1):(2*n), :) = grad_w;
grad((2*n + 1):(3*n), :) = grad_b;
