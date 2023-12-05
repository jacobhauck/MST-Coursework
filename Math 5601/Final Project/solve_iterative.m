function result = solve_iterative(B, c, x0, tol, dist, max_iter)

x = x0;
for i = 1:max_iter
    x_next = B * x + c;
    cauchy_error = dist(x, x_next);
    
    if cauchy_error < tol
        break;
    end
    
    x = x_next;
end

result = x;