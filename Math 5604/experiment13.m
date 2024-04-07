[x, u] = main_solver(128);
u0 = 1;
uN = 0;


plot(x, u);

function [x, u] = main_solver(n)
    x = linspace(0, 1, n+1);
    u_guess = 1 - x;
    u_int_guess = u_guess(2:end-1);
    
    u_int = newton2(newton_f, newton_f_prime, u_int_guess, 100, 1e-7, 0, 0);
    u = zeros(1, n+1);
    u(2:end-1) = u_int;
    u(1) = 1;
    u(end) = 0;
end

function u_int_next = newton_f(u_int_prev)
    n = length(u_int_prev) + 1;
    u_int_next = zeros(n-1, 1);
    u_int_next(2:end-1) = (u_int_prev(1:end-2) - 2*u_int_prev(2:end-1) + u_int_prev(3:end))/h^2 - fx_int(2:end-1);
    u_int_next(1) = (u0 - 2*u_int_prev(1) + u_int_prev(2))/h^2 - fx_int(1);
    u_int_next(end) = (u_int_prev(end-1) - 2*u_int_prev(end) + uN)/h^2 - fx_int(end);
end

function dF = newton_f_prime(u_int)
    n = length(u_int) + 1;
    diagonal = diag(-2/h^2 + 3*u_int.^2);
    left = diag(ones(n-2)/h^2, -1);
    right = diag(ones(n-2)/h^2, 1);
    dF = diagonal + left + right;
end