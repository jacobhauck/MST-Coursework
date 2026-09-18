function [Q, R] = hessqr(A)
% Compute the QR decomposition of a square Hessenberg matrix A using
% Householder reflections.
%
% Parameters
% ----------
%   A: (n, n) real Hessenberg matrix
% 
% Return
% ------
%   [Q, R]
%   Q: Orthogonal (n, n) matrix
%   R: Upper-triangular (n, n) matrix such that A = QR.

% Initialization
n = size(A, 1);

Q = eye(n, n);
R = A;  % Note that this is a copy

% Householder reflections
for k = 1:n-1
    u = R(k:k+1, k:k); % (2, 1), only first two entries are non-zero
    alpha = rot(u(1)) * norm(u);
    u(1) = u(1) - alpha;
    v = u / norm(u); % (2, 1)

    % This step is O(n) (because of fixed-size v) instead of O(n^3),
    % which makes the whole algorithm O(n^2) instead of O(n^3)
    R(k:k+1, 1:end) = R(k:k+1, 1:end) - (2*v) * (v'*R(k:k+1, 1:end));  % assign (2, n)
    Q(k:k+1, 1:end) = Q(k:k+1, 1:end) - (2*v) * (v'*Q(k:k+1, 1:end));  % assign (2, n)
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