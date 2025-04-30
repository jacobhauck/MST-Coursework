function [steps, state] = bisect(f, a, b, eps, eps_f, max_iter)
% Find a root of the given function using the bisection method.
% Parameters
% ----------
%   f: Callable; the function to find a root of. Must be continuous
%      and have a root in (a,b) (cannot have a root at a or b).
%   a: Number; left endpoint of search interval
%   b: Number; right endpoint of search interval. Must have b > a.
%   eps: Positive number; tolerance for forward error
%   eps_f: Positive number; tolerance for backward error
%   max_iter: Positive integer; maximum number of bisection steps 
%             to perform before stopping, regardless of whether 
%             accuracy tolerances have been achieved.
% Return
% ------
%   steps: history of steps taken in bisection sequence
%   state: string; reason for stopping. One of "max_iter", "eps", or
%          "eps_f".

% Initialize memory for steps
steps = zeros(1, max_iter + 1);

% Start at midpoint of search interval
k = 0;
a_k = a;
b_k = b;
x_k = (a_k + b_k) / 2;
f_k = f(x_k);
steps(k + 1) = x_k;

% Run bisection loop
while true
    % Check if stopping conditions are satisfied
    if k == max_iter
        state = "max_iter";
        break;
    end

    if (b_k - a_k) / 2 < eps
        state = "eps";
        break;
    end

    if abs(f_k) < eps_f
        state = "eps_f";
        break;
    end

    % Now do the bisection step
    k = k + 1;
    if f(a_k) * f_k < 0
        b_k = x_k;
    elseif f(b_k) * f_k < 0
        a_k = x_k;
    else
        % This case cannot happen if input is valid
        error("Invalid input for bisect");
    end
    x_k = (a_k + b_k) / 2;
    f_k = f(x_k);
    steps(k + 1) = x_k;
end

% Remove unused steps from return value
steps = steps(1:k+1);

end