% ===== Problem 3 =====

%% (b)
% Set eps = .05 and compute the "exact" solution using mesh size h=1/2048.
% Plot the "exact" solution.
fprintf("Begin problem 3 (b)\n\n");

eps = 0.05;

% Compute "exact" solution by using mesh size h=1/2048.
n_ex = 2048;
[x_ex, y_ex] = problem3(n_ex, eps);

% Plot the "exact" solution
fig = figure;
plot(x_ex, y_ex);
saveas(fig, "p3_exact.eps", "epsc");
fprintf("\n\n");

%% (c)
% Set eps = .05 and compute ell^inf and ell^2 errors with convergence
% orders for h in {1/8, 1/16, 1/32, 1/64, 1/128, 1/256}
fprintf("Begin problem 3 (c)\n\n");

eps = 0.05;

% Define number of steps
n = 2.^(3:8);

% Calculate numerical errors and display in a table with orders
fprintf("h\t\t2 error\t\t\t2 order\t\tinf error\t\tinf order\n");
fprintf("----------------------------------------------------------------\n");

% Keep track of last error for order calculation
last_error_2 = 0;
last_error_inf = 0;
for i_n = 1:length(n)
    % Calculate current errors
    [~, y] = problem3(n(i_n), eps);

    % To get exact solution at correct nodes, we need to step by
    % n_ex / n(i_n) (example: n_ex = 2048, n = 1024, so we step by 2 = 2048/1024,
    % which gives us indices 1,3,5,...,2047,2049 and sample points
    % 0, 1/1024, 2/1024, ..., 1023/1024, 1, as expected)
    index_step = round(n_ex / n(i_n));
    y_ex_n = y_ex(1:index_step:end);
    
    error_2 = norm(y - y_ex_n);
    error_inf = max(abs(y - y_ex_n));

    % Print table row
    if i_n > 1
        order_str_2 = sprintf("%f", log(error_2/last_error_2) / log(n(i_n-1)/n(i_n)));
        order_str_inf = sprintf("%f", log(error_inf/last_error_inf) / log(n(i_n-1)/n(i_n)));
    else
        order_str_2 = "-          ";
        order_str_inf = "-          ";
    end
    fprintf( ...
        "1/%d  \t%e\t%s\t%e\t%s\n", ...
        n(i_n), error_2, order_str_2, error_inf, order_str_inf ...
    );
    
    % Store current errors for next order calculation
    last_error_2 = error_2;
    last_error_inf = error_inf;
end
fprintf("\n\n");


%% (d)
% Set eps 0.001 and compute the numerical solution with h = 1/2048. Plot
% the numerical solution.
fprintf("Begin problem 3 (d)\n\n");

eps = 0.001;

% Compute solution by using mesh size h=1/2048.
[x, y] = problem3(2048, eps);

% Plot the solution
fig = figure;
plot(x, y);
saveas(fig, "p3c.eps", "epsc");
fprintf("\n\n");


%% (e)
% Set eps = 0.005 and compute ell^inf and ell^2 errors with convergence
% orders for h in {1/8, 1/16, 1/32, 1/64, 1/128, 1/256}
fprintf("Begin problem 3 (e)\n\n");

eps = 0.005;

% We need a new "exact" solution to approximate the errors. We
% use h = 1/2048 as before.
n_ex = 2048;
[x_ex, y_ex] = problem3(n_ex, eps);

% Define number of steps
n = 2.^(3:8);

% Calculate numerical errors and display in a table with orders
fprintf("h\t\t2 error\t\t\t2 order\t\tinf error\t\tinf order\n");
fprintf("----------------------------------------------------------------\n");

% Keep track of last error for order calculation
last_error_2 = 0;
last_error_inf = 0;
for i_n = 1:length(n)
    % Calculate current errors
    [~, y] = problem3(n(i_n), eps);

    % To get exact solution at correct nodes, we need to step by
    % n_ex / n(i_n)
    index_step = round(n_ex / n(i_n));
    y_ex_n = y_ex(1:index_step:end);
    
    error_2 = norm(y - y_ex_n);
    error_inf = max(abs(y - y_ex_n));

    % Print table row
    if i_n > 1
        order_str_2 = sprintf("%f", log(error_2/last_error_2) / log(n(i_n-1)/n(i_n)));
        order_str_inf = sprintf("%f", log(error_inf/last_error_inf) / log(n(i_n-1)/n(i_n)));
    else
        order_str_2 = "-          ";
        order_str_inf = "-          ";
    end
    fprintf( ...
        "1/%d  \t%e\t%s\t%e\t%s\n", ...
        n(i_n), error_2, order_str_2, error_inf, order_str_inf ...
    );
    
    % Store current errors for next order calculation
    last_error_2 = error_2;
    last_error_inf = error_inf;
end
fprintf("\n\n");
