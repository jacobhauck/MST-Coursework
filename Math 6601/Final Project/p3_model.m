function [value, varargout] = p3_model(t, theta)
% Compute the value of the model at the given points
% Parameters
% ----------
%   t: (m, 1) vector of t values at which to evaluate the model
%   theta: (3n, 1) vector of parameter values packed as theta = [c, w, b]
% 
% Return
% ------
%   value: (m, 1) vector of the model values at the given points
%
% OR
%   [value, cos_value]
%   value: same
%   cos_value: (m, n) matrix whose ij element is cos(w_jt_i + b_j)


% Get n and parameters
if mod(length(theta), 3) ~= 0
    error('Invalid parameter vector');
end
n = length(theta) / 3;
m = length(t);

c = theta(1:n, 1);
w = theta((n+1):(2*n), 1);
b = theta((2*n + 1):(3*n), 1);

% Compute cosine matrix
angle = repmat(w', m, 1) .* repmat(t, 1, n) + repmat(b', m, 1);
cos_value = cos(angle);

% Sum cosines using matrix multiply
value = cos_value * c;

% Optionally return cos/sin values for faster gradient/Hessian computation
if nargout == 3
    varargout{1} = cos_value;
    varargout{2} = sin(angle);
end

end