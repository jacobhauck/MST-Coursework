function [x, state] = newton(f, df, x0, linear_solver, vec_norm, mat_norm, eps, eps_f, eps_df, max_iter)
% Perform Newton's method to solve vector equation f(x) = 0.
% Parameters
% ----------
%   f: Callable (n x 1 -> n x 1); the function to find a root of. Must have det(df(x0)) != 0
%   df: Callable (n x 1 -> n x n); the Jacobian of f
%   x0: Vector (n x 1); the initial guess
%   linear_solver: Callable (n x n, n x 1 -> n x 1); the solver for
%                  inverting df; maps a matrix A and vector b to solution x
%                  of Ax = b.
%   vec_norm: Callable (n x 1 -> number); norm to use for vector tolerances
%   mat_norm: Callable (n x n -> number); norm to use for matrix tolerances
%   eps: Positive number; tolerance for forward error
%   eps_f: Positive number; tolerance for backward error
%   eps_df: Positive number; tolerance for derivative being nonzero
%   max_iter: Positive integer; maximum number of iterations before
%             stopping the iteration, regardless of whether tolerances are
%             satisfied.
% 
% Return
% ------
%   x: Vector (n x 1); the final output
%   state: String; reason for iteration termination. One of "eps", "eps_f",
%          "eps_df", or "max_iter".

% Start at initial guess
k = 0;
x_k = x0;
f_k = f(x_k);
df_k = df(x_k);

% Now do Newton iteration loop
while true
    % Look one step ahead ahead to compute errors
    delta = linear_solver(df_k, f_k);
    x_kp1 = x_k - delta;
    f_kp1 = f(x_kp1);
    df_kp1 = df(x_kp1);

    % Check stopping conditions
    if k == max_iter
        state = "max_iter";
        break;
    end

    if vec_norm(x_kp1 - x_k) < eps
        state = "eps";
        break;
    end

    if abs(f_kp1) < eps_f
        state = "eps_f";
        break;
    end

    if mat_norm(df_kp1) < eps_df
        state = "eps_df";
        break;
    end
    
    % Now update for the next step
    k = k + 1;
    x_k = x_kp1;
    f_k = f_kp1;
    df_k = df_kp1;
end

% Output x_kp1, the best approximation
x = x_kp1;

end