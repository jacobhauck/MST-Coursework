function hess = p3_num_hess(t, theta, g_value)
% Compute the Hessian of L_m using numerical differentiation (to check
% p3_hess)
% Parameters
% ----------
%   t: (m, 1) quadrature nodes
%   theta: (3n, 1) parameters, packed in order [c, w, b]
%   g_value: (m, 1) the values of the true function on the nodes
%
% Return
% ------
%   grad: (3n, 3n) the Hessiana of L_m w.r.t. theta, approximately. Packed
%         in same order as theta

if mod(length(theta), 3) ~= 0
    error('Invalid parameters');
end
n = length(theta) / 3;

hess = zeros(3*n, 3*n);

for i = 1:(3*n)
    % prepare perturbations of theta in the i direction
    theta_i_l = theta;
    theta_i_l(i) = theta_i_l(i) - 0.001;
    theta_i_r = theta;
    theta_i_r(i) = theta_i_r(i) + 0.001;
    for j = 1:(3*n)
        % compute dL_m/(dtheta_i dtheta_j)
        theta_i_l_j_l = theta_i_l;
        theta_i_l_j_l(j) = theta_i_l_j_l(j) - 0.001;
        theta_i_l_j_r = theta_i_l;
        theta_i_l_j_r(j) = theta_i_l_j_r(j) + 0.001;
        theta_i_r_j_l = theta_i_r;
        theta_i_r_j_l(j) = theta_i_r_j_l(j) - 0.001;
        theta_i_r_j_r = theta_i_r;
        theta_i_r_j_r(j) = theta_i_r_j_r(j) + 0.001;
        
        % Get values at nearby points
        value_i_l_j_l = p3_loss(p3_model(t, theta_i_l_j_l), g_value);
        value_i_l_j_r = p3_loss(p3_model(t, theta_i_l_j_r), g_value);
        value_i_r_j_l = p3_loss(p3_model(t, theta_i_r_j_l), g_value);
        value_i_r_j_r = p3_loss(p3_model(t, theta_i_r_j_r), g_value);

        % First compute gradient along j direction at nearby points in i
        % direction
        grad_j_i_l = (value_i_l_j_r - value_i_l_j_l) / 0.002;
        grad_j_i_r = (value_i_r_j_r - value_i_r_j_l) / 0.002;
        
        % Now compute derivative of gradient along i direction
        hess(i, j) = (grad_j_i_r - grad_j_i_l) / 0.002;
    end
end

end