function x = newton(f, f_prime, x0, max_iter, tol, tol_f)
% Newton iteration in n dimensions
%
% Parameters
% ----------
%   f: function taking n x 1 column vector to n x 1 column vector
%   f_prime: jacobian of f, mapping n x 1 column vector n x n matrix
%   x0: initial guess, n x 1 column vector
%   max_iter: maximum number of Newton iterations
%   tol: \ell^\infty stopping tolerance, return x_m if |x_m - x_{m-1}| < tol
%   tol_f: \ell^\infty stopping tolerance for f, return x_m if |f(x_m)| < tol_f
% 
% Return
% ------
%   x: approximate root of f

% initializtion. Compute f for tol_f criterion
x = x0;
f_prev = f(x);

% Iteration
for i = 1:max_iter
    % Newton iteration step
    dx = -f_prime(x) \ f_prev;
    x = x + dx;
    
    % Compute f for tolerance criterion and next iteration
    f_prev = f(x);
    
    % Check stopping conditions
    if max(abs(dx)) < tol || max(abs(f_prev)) < tol_f
        break;
    end
end
