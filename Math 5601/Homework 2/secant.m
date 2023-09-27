function result = secant(f, x0, x1, epsilon, epsilon_f, max_it)
    xk = x0;
    fk = f(xk);
    x_next = x1;

    for k = 1:max_it
        xkm1 = xk;
        xk = x_next;
        
        fkm1 = fk;
        fk = f(xk);

        cauchy_error = abs(xk - xkm1);
        x_next = xk - fk * (xk - xkm1) / (fk - fkm1);
        
        fprintf( ...
            ['k = %d, x_{k-1} = %.05g, xk = %.05g, Cauchy error = %.05g, ' ...
            'f(xk) = %.05g\n'], ...
            k, xkm1, xk, cauchy_error, fk ...
        );

        if cauchy_error < epsilon || abs(fk) < epsilon_f
            break;
        end
    end

    result = xk;
