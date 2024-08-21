m = 47;

max_n = 8192;
min_n = 32;

while true
    n = round((min_n + max_n) / 2);
    if is_stable(m, n)
        max_n = n;
    else
        min_n = n;
    end

    if max_n - min_n <= 2
        break;
    end
end

fprintf("Stability cutoff ratio in [%f, %f]\n", m^2/max_n, m^2/min_n);

function result = is_stable(m, n)
    [t, x, u] = problem1(m, n, 1);
    u_ex = exp(-1) * sin(pi*(x+1/2));
    result = (max(abs(u(:, end) - u_ex)) < .001);
end