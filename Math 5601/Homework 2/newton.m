function result = newton(f, f_prime, x0, epsilon, epsilon_f, epsilon_f_prime, max_it)
    x_next = x0;

    for k = 0:max_it
        xk = x_next;
        fk = f(xk);
        f_primek = f_prime(xk);

        % check f_prime not zero *before* dividing by it
        if abs(f_primek) <= epsilon_f_prime  
            fprintf("Failed. f_prime too small.\n");
            break;
        end
        
        % now we can update x_next and compute Cauchy error
        x_next = xk - fk / f_primek;
        cauchy_error = abs(x_next - xk);

        fprintf( ...
            "k = %d, x_k = %.5g, Cauchy error = %.5g, f(x_k) = %.5g, f'(x_k) = %.5g\n", ...
            k, xk, cauchy_error, fk, f_primek ...
        );

        if cauchy_error < epsilon || abs(fk) < epsilon_f
            break;
        end
    end
    
    result = xk;
