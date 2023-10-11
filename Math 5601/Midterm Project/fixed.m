function result = fixed(g, x0, epsilon, max_it, log_iterations)

x_next = x0;
    
for k = 0:max_it
    xk = x_next;
    x_next = g(xk);
    cauchy_error = abs(x_next - xk);

    if cauchy_error < epsilon
        break;
    end
end

if log_iterations
    fprintf("Fixed point iterations = %d\n", k);
end

result = xk;
