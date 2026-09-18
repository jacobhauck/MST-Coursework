function t = p3_t(m)
% Get the quadrature nodes for the given m
% Parameters
% ----------
%   m: number of intervals (number of points in loss function)
%
% Return
%   t: the quadrature nodes

t = linspace(0, 1, m+1)';
t = t(2:end, :);  % Drop 0

end