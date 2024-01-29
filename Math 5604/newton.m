function root = newton(f, f_prime, x0, max_iter, tol, tol_f, tol_f_prime)

x = x0;
f_prev = f(x);

for i = 1:max_iter
    prev = x;
    f_prime_prev = f_prime(prev);

    if abs(f_prime_prev) < tol_f_prime
        fprintf("Newton iteration failed.");
        break;
    end

    x = prev - f_prev / f_prime_prev;
    f_prev = f(x);

    if abs(x - prev) < tol || abs(f_prev) < tol_f
        break;
    end
end

root = x;
