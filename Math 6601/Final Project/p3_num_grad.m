function grad = p3_num_grad(t, theta, g_value)
% Compute the gradient of L_m using numerical differentiation (to check
% p3_grad)
% Parameters
% ----------
%   t: (m, 1) quadrature nodes
%   theta: (3n, 1) parameters, packed in order [c, w, b]
%   g_value: (m, 1) the values of the true function on the nodes
%
% Return
% ------
%   grad: (3n, 1) the gradient of L_m w.r.t. theta, approximately. Packed
%         in same order as theta

if mod(length(theta), 3) ~= 0
    error('Invalid parameters');
end
n = length(theta) / 3;

grad = zeros(3*n, 1);
for i = 1:(3*n)
    theta_l = theta;
    theta_l(i) = theta_l(i) - 0.001;
    theta_r = theta;
    theta_r(i) = theta_r(i) + 0.001;
    value_l = p3_model(t, theta_l);
    value_r = p3_model(t, theta_r);
    loss_l = p3_loss(value_l, g_value);
    loss_r = p3_loss(value_r, g_value);
    grad(i) = (loss_r - loss_l) / 0.002;
end

end