function [steps, state] = fixed(g, x0, eps, eps_g, max_iter)
% Perform fixed point iteration for the given function g.
% Parameters
% ----------
%   g: Callable; the function to find the fixed point of
%   x0: Number; the initial guess
%   eps: Positive number; the tolerance for the forward error
%   eps_g: Positive number; the tolerance for the backward error
%   max_iter: Positive integer; maximum number of iteration steps after 
%             which to stop the iteration, regardless of whether any 
%             tolerances are met.
%
% Return
% ------
%   steps: History of the fixed point iteration steps
%   state: String; reason for termination. One of "max_iter", "eps" or
%          "eps_g".


% Initialize memory for steps
steps = zeros(1, max_iter + 2); % +2 because x_{k+1} is computed on step k

% Start at initial guess
k = 0;
x_k = x0;
g_k = g(x_k);
steps(k + 1) = x_k;

% Now do fixed point loop
while true
    % Do one step ahead
    x_kp1 = g_k;
    g_kp1 = g(x_kp1);
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

    if abs(g_kp1 - x_kp1) < eps_g
        state = "eps_f";
        break;
    end
    
    % Now update for the next step
    k = k + 1;
    x_k = x_kp1;
    g_k = g_kp1;
end

% Remove unused values from steps
steps = steps(1:k+2);

end