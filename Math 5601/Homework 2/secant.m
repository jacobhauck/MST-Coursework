function result = secant(f, x0, x1, epsilon, epsilon_f, max_it)
    x_k = x0;
    f_k = f(x_k);
    x_next = x1;

    for k = 1:max_it
        x_km1 = x_k;
        x_k = x_next;
        
        f_km1 = f_k;
        f_k = f(x_k);

        cauchy_error = abs(x_k - x_km1);
        fprintf( ...
            "k = %d, x_{k-1} = %.05g, x_k = %.05g, Cauchy error = %.05g, f(x_k) = %.05g\n", ...
            k, x_km1, x_k, cauchy_error, f_k ...
        );

        if cauchy_error < epsilon || abs(f_k) < epsilon_f
            break;
        end

        x_next = x_k - f_k * (x_k - x_km1) / (f_k - f_km1);
    end

    result = x_k;
