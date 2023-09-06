function result = fixed(g, x0, epsilon, epsilon_g, max_it)
    x_next = x0;
    
    for k = 0:max_it
        xk = x_next;
        x_next = g(xk);
        error = abs(x_next - xk);

        fprintf(...
            "k = %d, x_k = %.5g, Cauchy error = %.5g, f(x_k) = %.5g\n",...
            k, xk, error, x_next...
        )

        if error < epsilon || abs(x_next) < epsilon_g
            break;
        end
    end

    result = xk;
