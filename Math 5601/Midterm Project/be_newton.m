function result = be_newton( ...
    f, dfdy, epsilon, epsilon_f, epsilon_f_prime, max_it, log_iterations ...
)

% creates a backward Euler solver function for y' = f(t,y)
% that maps (x_0, t, h) to the solution of x = x_0 + h * f(t,x)
% using Newton's method with initial point x_0
result = @(x_0, t, h) newton( ...
    @(x) x - x_0 - h * f(t, x), @(x) 1 - h * dfdy(t, x), ...
    x_0, epsilon, epsilon_f, epsilon_f_prime, max_it, log_iterations ...
);
