function result = solve_iterative(B, c, x0, tol, dist, max_iter)

x = x0;
for i = 1:max_iter
    x_next = B * x + c;
    cauchy_error = dist(x, x_next);
    
    fprintf(['Iteration %d: x = (%.03e, %.03e, %.03e),', ...
        ' x_next = (%.03e, %.03e, %.03e), Cauchy error = %.05e\n'], ...
        i, x(1), x(2), x(3), x_next(1), x_next(2), x_next(3), ...
        cauchy_error ...
    );

    if cauchy_error < tol
        break;
    end
    
    x = x_next;
end

result = x;