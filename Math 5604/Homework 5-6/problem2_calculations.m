% ===== Problem 2 =====

% Define exact solution
y_ex = @(x) sin(2*x);

%% (b)
% Solve using centered scheme for the BC with h in {pi/8, pi/16, pi/32, pi/64, pi/128,
% pi/256}. Present ell^infty and ell^2 errors with convergence order.
fprintf("Begin problem 2 (b)\n\n");

% Define number of steps
n = 2.^(3:8);

% Calculate numerical errors and display in a table with orders
fprintf("h\t\t\t2 error\t\t\t2 order\t\tinf error\t\tinf order\n");
fprintf("----------------------------------------------------------------\n");

% Keep track of last error for order calculation
last_error_2 = 0;
last_error_inf = 0;
for i_n = 1:length(n)
    % Calculate current errors
    [x, y] = problem2_center(n(i_n));
    error_2 = norm(y - y_ex(x));
    error_inf = max(abs(y - y_ex(x)));

    % Print table row
    if i_n > 1
        order_str_2 = sprintf("%f", log(error_2/last_error_2) / log(n(i_n-1)/n(i_n)));
        order_str_inf = sprintf("%f", log(error_inf/last_error_inf) / log(n(i_n-1)/n(i_n)));
    else
        order_str_2 = "-          ";
        order_str_inf = "-          ";
    end
    fprintf( ...
        "pi/%d    \t%e\t%s\t%e\t%s\n", ...
        n(i_n), error_2, order_str_2, error_inf, order_str_inf ...
    );
    
    % Store current errors for next order calculation
    last_error_2 = error_2;
    last_error_inf = error_inf;
end
fprintf("\n\n");


%% (b)
% Solve using one-sided scheme for the BC with h in {pi/8, pi/16, pi/32, pi/64, pi/128,
% pi/256}. Present ell^infty and ell^2 errors with convergence order.
fprintf("Begin problem 2 (d)\n\n");

% Define number of steps
n = 2.^(3:8);

% Calculate numerical errors and display in a table with orders
fprintf("h\t\t\t2 error\t\t\t2 order\t\tinf error\t\tinf order\n");
fprintf("----------------------------------------------------------------\n");

% Keep track of last error for order calculation
last_error_2 = 0;
last_error_inf = 0;
for i_n = 1:length(n)
    % Calculate current errors
    [x, y] = problem2_one_sided(n(i_n));
    error_2 = norm(y - y_ex(x));
    error_inf = max(abs(y - y_ex(x)));

    % Print table row
    if i_n > 1
        order_str_2 = sprintf("%f", log(error_2/last_error_2) / log(n(i_n-1)/n(i_n)));
        order_str_inf = sprintf("%f", log(error_inf/last_error_inf) / log(n(i_n-1)/n(i_n)));
    else
        order_str_2 = "-          ";
        order_str_inf = "-          ";
    end
    fprintf( ...
        "pi/%d    \t%e\t%s\t%e\t%s\n", ...
        n(i_n), error_2, order_str_2, error_inf, order_str_inf ...
    );
    
    % Store current errors for next order calculation
    last_error_2 = error_2;
    last_error_inf = error_inf;
end
fprintf("\n\n");
