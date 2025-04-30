function [steps, state] = newton_nd(f, df, x0, vec_norm, mat_norm, eps, eps_f, eps_df, max_iter)
% Perform Newton's method to solve vector equation f(x) = 0.
% Parameters
% ----------
%   f: Callable (n x 1 -> n x 1); the function to find a root of. Must have det(df(x0)) != 0
%   df: Callable (n x 1 -> n x n); the Jacobian of f
%   x0: Vector (n x 1); the initial guess
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
%   steps: History of Newton iteration steps.
%   state: String; reason for iteration termination. One of "eps", "eps_f",
%          "eps_df", or "max_iter".

% Initialize memory for steps
steps = zeros(size(x0, 1), max_iter + 2); % +2 because x_{k+1} is computed on step k

% Start at initial guess
k = 0;
x_k = x0;
f_k = f(x_k);
df_k = df(x_k);
steps(:, k + 1) = x_k;

% Now do Newton iteration loop
while true
    % Look one step ahead ahead to compute errors
    delta = df_k \ f_k;
    x_kp1 = x_k - delta;
    f_kp1 = f(x_kp1);
    df_kp1 = df(x_kp1);
    steps(:, k + 2) = x_kp1;

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

% Remove unused values from steps
steps = steps(:, 1:k+2);

end