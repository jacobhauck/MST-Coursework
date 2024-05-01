

%% Second-order accuracy in time
fprintf("Second-order accuracy in time\n\n");

m = 2048;
ns = 2.^(3:7);
fn_u_ex = @(t, x) sin(pi*(x+1/2)) * exp(-t);

fprintf("k\tinf err\tinf rate\t2 err \t 2 rate\n");
last_2_err = 0;
last_inf_err = 0;
for i_n = 1:length(ns)
    n = ns(i_n);
    [t, x, u] = problem2(m, n, 1);
    u_ex = fn_u_ex(t, x);
    
    inf_err = max(abs(u(:, end) - u_ex(:, end)));
    l2_err = sqrt(1/m) * norm(u(:, end) - u_ex(:, end));
    inf_rate = "-";
    l2_rate = "-";
    if i_n > 1
        inf_rate = sprintf("%f", log(inf_err / last_inf_err) / log(ns(i_n-1) / n));
        l2_rate = sprintf("%f", log(l2_err / last_2_err) / log(ns(i_n-1) / n));
    end

    fprintf("1/%d\t%e\t%s\t%e\t%s\n", ...
        n, inf_err, inf_rate, l2_err, l2_rate ...
    );
    last_inf_err = inf_err;
    last_2_err = l2_err;
end
fprintf("\n");


%% Second-order accuracy in space
fprintf("Second order accuracy in space\n\n");

ms = 2.^(4:8);
n = 2^8;
fn_u_ex = @(t, x) sin(pi*(x+1/2)) * exp(-t);

fprintf("h\tinf err\tinf rate\t2 err \t 2 rate\n");
last_2_err = 0;
last_inf_err = 0;
for i_m = 1:length(ms)
    m = ms(i_m);
    [t, x, u] = problem2(m, n, 1);
    u_ex = fn_u_ex(t, x);
    inf_err = max(abs(u(:, end) - u_ex(:, end)));
    l2_err = sqrt(1/m) * norm(u(:, end) - u_ex(:, end));
    inf_rate = "-";
    l2_rate = "-";
    if i_m > 1
        inf_rate = sprintf("%f", log(inf_err / last_inf_err) / log(ms(i_m-1) / m));
        l2_rate = sprintf("%f", log(l2_err / last_2_err) / log(ms(i_m-1) / m));
    end

    fprintf("1/%d\t%e\t%s\t%e\t%s\n", ...
        m, inf_err, inf_rate, l2_err, l2_rate ...
    );
    last_inf_err = inf_err;
    last_2_err = l2_err;
end
