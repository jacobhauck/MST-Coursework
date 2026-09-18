function L_m = p3_loss(value, g_value)
% Compute the discretized loss L_m
% Parameters
% ----------
%   value: (m, 1) model value on the quadrature nodes
%   g_value: (m, 1) true function value on the quadrature nodes

L_m = mean((value - g_value).^2);

end