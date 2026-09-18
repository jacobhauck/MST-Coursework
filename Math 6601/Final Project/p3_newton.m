function theta = p3_newton(g_value, theta, max_steps, print_steps, loss_cutoff)
% Train the model with gradient descent
% Parameters
% ----------
%   g_value: (m, 1) true function values on the nodes
%   theta: (n, 1) Initial parameter guess
%   max_steps: maximum number of steps
%   print_steps: number of steps between printing loss updates
%   loss_cutoff: stop iteration when loss is below this threshold
% 
% Return
% ------
%   theta: (3n, 1) the optimized model parameters

% Preliminary computations
m = length(g_value);
t = p3_t(m);

% Newton's method to solve the optimization problem
for k = 1:max_steps
    [value, cos_value, sin_value] = p3_model(t, theta);
    loss = p3_loss(value, g_value);

    % Stop if we achieved the desired loss
    if loss < loss_cutoff
        break;
    end
    
    % Compute Hessian and gradient
    grad = p3_grad(value, g_value, cos_value, sin_value, theta);
    hess = p3_hess(value, g_value, cos_value, sin_value, theta);
    
    % One step of Newton's method
    delta = -hess \ grad;
    theta = theta + delta;
    
    % Print updates
    if mod(k, print_steps) == 0
        fprintf("Newton step %d. Loss %.06e\n", k, loss);
        fprintf("                |grad| %.06e\n", norm(grad));
        fprintf("                cond %.06e\n", cond(hess));
        fprintf("\n");
    end
end
fprintf('Loss = %.06e\n', loss);
fprintf('Training finished in %d steps.\n', k-1);
