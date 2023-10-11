function result = be_fixed(f, epsilon, max_it, log_iterations)

% creates a backward Euler solver function for y' = f(t,y)
% that maps (x_0, t, h) to the solution of x = x_0 + h * f(t,x)
result = @(x_0, t, h) fixed(@(x) x_0 + h * f(t,x), x_0, epsilon, max_it, ...
    log_iterations);
