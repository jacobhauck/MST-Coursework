function root = newton(f, f_prime, x0, max_iter, tol, tol_f, tol_f_prime)

x = x0;
f_prev = f(x);

for i = 1:max_iter
    prev = x;
    f_prime_prev = f_prime(prev);

    if norm(f_prime_prev) < tol_f_prime
        fprintf("Newton iteration failed.");
        break;
    end
    
    dx = -f_prime_prev \ f_prev;
    x = x + dx;
    f_prev = f(x);

    if max(abs(x - prev)) < tol || max(abs(f_prev)) < tol_f
        break;
    end
end

root = x;
