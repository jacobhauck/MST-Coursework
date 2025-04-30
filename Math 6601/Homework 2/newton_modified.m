function [steps, state] = newton_modified(m, f, df, x0, eps, eps_f, eps_df, max_iter)
% Perform Newton's method to solve scalar equation f(x) = 0 for a root with
% multiplicity m.
% Parameters
% ----------
%   m: Positive integer; the multiplicity of the root.
%   f: Callable; the function to find a root of. Must have f'(x0) != 0.
%   df: Callable; the derivative of f
%   x0: Number; the initial guess
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
steps = zeros(1, max_iter + 2); % +2 because x_{k+1} is computed on step k

% Start at initial guess
k = 0;
x_k = x0;
f_k = f(x_k);
df_k = df(x_k);
steps(k + 1) = x_k;

% Now do Newton iteration loop
while true
    % Look one step ahead ahead to compute errors
    x_kp1 = x_k - m * f_k / df_k;
    f_kp1 = f(x_kp1);
    df_kp1 = df(x_kp1);
    steps(k + 2) = x_kp1;

    % Check stopping conditions
    if k == max_iter
        state = "max_iter";
        break;
    end

    if abs(x_kp1 - x_k) < eps
        state = "eps";
        break;
    end

    if abs(f_kp1) < eps_f
        state = "eps_f";
        break;
    end

    if abs(df_kp1) < eps_df
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
steps = steps(1:k+2);

end