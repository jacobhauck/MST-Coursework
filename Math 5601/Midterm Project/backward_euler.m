function result = backward_euler(solver, y_a, a, b, h)

% get as close to b as possible without going past on the last step
num_steps = floor((b - a) / h);

y = zeros(1, num_steps);
t = zeros(1, num_steps);

t(1) = a;
y(1) = y_a;

for j = 2:num_steps
    t(j) = t(j-1) + h;
    
    % solver : (x_0, t, h) -> solution of x = x_0 + h * f(t, x)
    y(j) = solver(y(j-1), t(j), h);
end

result = y;
