% ===== Problem 1 =====

% Define exact solution
y_ex = @(x) sin(2*x);

%% (b)
% Calculate errors at t=1 for k in {1/8, 1/16, 1/32, 1/64, 1/128, 1/256}
% and compute order of BDF2 method.
fprintf("Begin problem 1 (b)\n\n");

% Define time steps
k = (1/2).^(3:8);

% Calculate numerical errors at t=1 and display in a table with orders
fprintf("k\t\terror\t\t\torder\n");
fprintf("--------------------------------\n");

% Keep track of last error for order calculation
last_error = 0;
for i_k = 1:length(k)
    % Calculate current error at t=1
    [x, y] = problem1_bdf2(k(i_k));
    error = abs(y(end) - y_ex(1));

    % Print table row
    if i_k > 1
        order_str = sprintf("%f", log(error/last_error) / log(k(i_k)/k(i_k-1)));
    else
        order_str = "-";
    end
    fprintf("1/%d  \t%e\t%s\n", round(1/k(i_k)), error, order_str);
    
    % Store current error for next order calculation
    last_error = error;
end
fprintf("\n\n");

%% (c)
% Calculate errors at t=1 for k in {1/8, 1/16, 1/32, 1/64, 1/128, 1/256}
% and compute order of TR-BDF2 method.
fprintf("Begin problem 1 (c)\n\n");

% Define time steps
k = (1/2).^(3:8);

% Calculate numerical errors at t=1 and display in a table with orders
fprintf("k\t\terror\t\t\torder\n");
fprintf("--------------------------------\n");

% Keep track of last error for order calculation
last_error = 0;
for i_k = 1:length(k)
    % Calculate current error at t=1
    [x, y] = problem1_trbdf2(k(i_k));
    error = abs(y(end) - y_ex(1));

    % Print table row
    if i_k > 1
        order_str = sprintf("%f", log(error/last_error) / log(k(i_k)/k(i_k-1)));
    else
        order_str = "-";
    end
    fprintf("1/%d  \t%e\t%s\n", round(1/k(i_k)), error, order_str);
    
    % Store current error for next order calculation
    last_error = error;
end
fprintf("\n\n");
