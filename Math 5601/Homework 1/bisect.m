function result = bisect(f, a, b, epsilon, epsilon_f, max_it)
    for k = 0:max_it
        xk = (a + b) / 2;
        fk = f(xk);
        max_error = (b - a) / 2;

        fprintf( ...
            'k = %d, x_k = %.5g, max error = %.5g, f(x_k) = %.5g\n', ...
            k, xk, max_error, fk ...
        );

        if max_error < epsilon || abs(fk) < epsilon_f
            break;
        elseif f(a) * fk < 0  % root lies in [a, x]
            b = xk;
        else  % if root is not in [a, x], it must be in [x, b]
            a = xk;
        end
    end

    result = xk;
