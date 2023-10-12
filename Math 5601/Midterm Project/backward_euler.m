function [t, y] = backward_euler(solver, g_a, a, b, h)

% get as close to b as possible without going past on the last step
% add one step for the initial value
num_steps = 1 + floor((b - a) / h);

t = zeros(1, num_steps);
y = zeros(1, num_steps);

t(1) = a;
y(1) = g_a;

for j = 2:num_steps
    t(j) = t(j-1) + h;
    
    % solver : (x_0, t, h) -> solution of x = x_0 + h * f(t, x)
    y(j) = solver(y(j-1), t(j), h);
end
