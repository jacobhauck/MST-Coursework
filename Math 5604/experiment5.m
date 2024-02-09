function x = experiment5(x0, f, df, eps, max_iter)

x = x0;

for i = 1:max_iter
    dx = -df(x) \ f(x);
    x = x + dx;

    if norm(dx) < eps
        break;
    end
end