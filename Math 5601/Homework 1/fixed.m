function result = fixed(g, x0, epsilon, max_it)
    x_next = x0;
    
    for k = 0:max_it
        xk = x_next;
        x_next = g(xk);
        cauchy_error = abs(x_next - xk);

        fprintf(...
            'k = %d, x_k = %.5g, Cauchy error = %.5g, f(x_k) = %.5g\n',...
            k, xk, cauchy_error, x_next...
        )

        if cauchy_error < epsilon
            break;
        end
    end

    result = xk;
