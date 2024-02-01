function x = newton(f, f_prime, x0, max_iter, tol, tol_f, tol_f_prime)
% Newton's method for solving f(x) = 0
%
% Parameters
% ----------
%   f: function f (anonymous MATLAB function)
%   f_prime: derivative of f (anonymous MATLAB function)
%   x0: initial guess for root of f(x) = 0
%   max_iter: maximum number of Newton iterations
%   tol: Cauchy stopping tolerance (stop if |x_{n+1} - x_n| < tol, return x_{n+1})
%   tol_f: Function stopping tolerance (stop if |f(x_n)| < tol_f, return x_n)
%   tol_f_prime: Derivative singularity tolerance 
%                (fail if |f_prime(x_n)| < tol_f_prime)
%
% Return
% ------
%   x: the Newton approximation of a root of f(x) = 0 starting from x0

% initialization
x = x0;
f_prev = f(x);

% Newton iteration
for i = 1:max_iter
    prev = x;
    f_prime_prev = f_prime(prev);
    
    % check for singularity in f' before doing the division
    if abs(f_prime_prev) < tol_f_prime
        fprintf("Newton iteration failed.");
        break;
    end
    
    % one step of iteration
    x = prev - f_prev / f_prime_prev;

    % get function value to check stopping condition and to use on next
    % step
    f_prev = f(x);
    
    % Check stopping conditions
    if abs(x - prev) < tol || abs(f_prev) < tol_f
        break;
    end
end