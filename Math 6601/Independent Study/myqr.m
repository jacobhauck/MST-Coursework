function [Q, R] = myqr(A)
% Compute the QR decomposition of A using Householder reflections.
%
% Parameters
% ----------
%   A: (m, n) real matrix, m >= n.
% 
% Return
% ------
%   [Q, R]
%   Q: Orthogonal (m, m) matrix
%   R: Upper-triangular (m, n) matrix such that A = QR.

% Initialization
m = size(A, 1);
n = size(A, 2);
if m < n
    error("Must have m >= n.");
end
Q = eye(m, m);
R = A;  % note that this is a copy

% Householder reflections
for k = 1:min(m-1, n)
    u = R(k:end, k:k); % (m-k+1, 1)
    alpha = rot(u(1)) * norm(u);
    u(1) = u(1) - alpha;
    v = u / norm(u); % (m-k+1, 1)
    R(k:end, k:end) = R(k:end, k:end) - (2*v) * (v' * R(k:end, k:end));  % assign (m-k+1, n-k+1)
    Q(k:end, 1:end) = Q(k:end, 1:end) - (2*v) * (v' * Q(k:end, 1:end));  % assign (m-k+1, m)
end

% We were actually tracking Q', so transpose to get Q
Q = Q';

end

function w = rot(z)
% Rotate z by 180 degrees in the complex plane
if imag(z) == 0  % exact equality check is fine for checking if we should use real arithmetic
    w = -sign(z);
else
    w = exp(1i * (phase(z) + pi));
end
end