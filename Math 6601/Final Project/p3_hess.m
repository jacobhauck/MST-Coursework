function hess = p3_hess(value, g_value, cos_value, sin_value, theta)
% Compute the Hessian of the discretized loss L_m using the given nodes
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
%   hess: (3n, 3n) Hessian of L_m w.r.t. theta, packed in the same order as
%         theta

% Get n and parameters
if mod(length(theta), 3) ~= 0
    error('Invalid parameter vector');
end
n = length(theta) / 3;
m = length(value);

c = theta(1:n, 1);
c_rep = repmat(c', m, 1);  % (m, n)

% Compute Hessian
t = p3_t(m);  % (m, 1)
t2 = t.^2;
t_rep = repmat(t, 1, n);  % (m, n)
t2_rep = repmat(t2, 1, n);  % (m, n)
diff = value - g_value;  % (m, 1)

% Some shared computations
c_cos = c_rep .* cos_value;
c_sin = c_rep .* sin_value;
c_sin_t = c_sin .* t_rep;

% Compute submatrices
hess_cc = (2/m) * (cos_value'*cos_value);  % (n, n) (all)
hess_wc = (-2/m) * (c_sin_t'*cos_value + diag(sin_value' * (diff.*t)));
hess_bc = (-2/m) * (c_sin'*cos_value + diag(sin_value'*diff));
hess_ww = (2/m) * ((c_sin.*t2_rep)'*c_sin - diag(c_cos' * (diff.*t2)));
hess_bw = (2/m) * (c_sin_t'*c_sin - diag(c_cos' * (diff.*t)));
hess_bb = (2/m) * (c_sin'*c_sin - diag(c_cos'*diff));

% Pack hessian submatrices
hess = zeros(3*n, 3*n);
hess(1:n, 1:n) = hess_cc;
hess(1:n, (n+1):(2*n)) = hess_wc';
hess((n+1):(2*n), 1:n) = hess_wc;
hess(1:n, (2*n + 1):(3*n)) = hess_bc';
hess((2*n + 1):(3*n), 1:n) = hess_bc;
hess((n+1):(2*n), (n+1):(2*n)) = hess_ww;
hess((n+1):(2*n), (2*n + 1):(3*n)) = hess_bw';
hess((2*n + 1):(3*n), (n+1):(2*n)) = hess_bw;
hess((2*n + 1):(3*n), (2*n + 1):(3*n)) = hess_bb;