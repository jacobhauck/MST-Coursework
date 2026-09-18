function theta = p3_gradient_descent(g_value, theta, lr, max_steps, print_steps, loss_cutoff)
% Train the model with gradient descent
% Parameters
% ----------
%   g_value: (m, 1) true function values on the nodes
%   theta: (3n, 1) Initial parameter guess
%   lr: learning rate
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

% Gradient descent loop
for k = 1:max_steps
    [value, cos_value, sin_value] = p3_model(t, theta);
    loss = p3_loss(value, g_value);
    
    % Stop if we achieved the desired loss
    if loss < loss_cutoff
        break;
    end

    % Otherwise do a GD update
    grad_theta = p3_grad(value, g_value, cos_value, sin_value, theta);
    theta = theta - lr * grad_theta;

    if mod(k, print_steps) == 0
        fprintf("Step %d. Loss = %.06e\n", k, loss);
        fprintf("         |grad| = %.06e\n", norm(grad_theta));
        fprintf("\n");
    end
end

if loss > loss_cutoff
    error('Failed to converge to desired level of accuracy.');
end

fprintf('Loss = %.06e\n', loss);
fprintf('Training converged in %d steps.\n', k-1);
