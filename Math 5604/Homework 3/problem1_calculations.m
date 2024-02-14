% ===== Problem 1 =====

%% === (a) ===
% Implementation of backward Euler. See problem1.m and newton.m.

%% === (b) ===
% What are the numerical values of x(1), y(1), z(1) with k = 1/16 and
% k = 1/64?
fprintf("Running problem 1 (b)\n");

% Solve with k = 1/16
[t, u] = problem1(1/16);

fprintf( ...
    "k = 1/16. Numerical value of (x(1), y(1), z(1)) = (%f, %f, %f)\n", ...
    u(1, end), u(2, end), u(3, end) ...
);

% Solve with k = 1/64
[t, u] = problem1(1/64);

fprintf( ...
    "k = 1/64. Numerical value of (x(1), y(1), z(1)) = (%f, %f, %f)\n", ...
    u(1, end), u(2, end), u(3, end) ...
);

fprintf("\n");

%% === (c) ===
% Create error table.
fprintf("Running problem 1 (c)\n");

% Exact solution
u_fn = @(t) [exp(-t); cos(t); t.^2];

% k values to compute error at
k = (1/2).^(2:9);

% Allocate storage for numerical solution values at t = 1
u_at_1 = zeros(3, length(k));

% Run backward Euler for each k value and store numerical solutions
for i_k = 1:length(k)
    [t, u] = problem1(k(i_k));
    u_at_1(:, i_k) = u(:, end);
end

% Get exact solution at t = 1 and compute component-wise error
errors = abs(u_at_1 - u_fn(1));

% Display table
fprintf("\t        \tx        \t         \ty        \t        \tz        \t        \tu        \t\n");
fprintf("k   \terror   \trate    \terror   \trate    \terror   \trate    \tl^infty error\trate\n");
fprintf("--------------------------------------------------------------------------------------------------------\n")
fprintf( ...
    "1/%d  \t%f\t-         \t%f\t-       \t%f\t-       \t%f\t    -\n", ...
    round(1/k(1)), ...
    errors(1, 1), ...
    errors(2, 1), ...
    errors(3, 1), ...
    max(errors(:, 1)) ...
);
for i_k = 2:length(k)
    denom = log(k(i_k) / k(i_k - 1));
    fprintf( ...
        "1/%d  \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t    %f\n", ...
        round(1/k(i_k)), ...
        errors(1, i_k), log(errors(1, i_k) / errors(1, i_k-1)) / denom, ...
        errors(2, i_k), log(errors(2, i_k) / errors(2, i_k-1)) / denom, ...
        errors(3, i_k), log(errors(3, i_k) / errors(3, i_k-1)) / denom, ...
        max(errors(:, i_k)), log(max(errors(:, i_k)) / max(errors(:, i_k - 1))) / denom ...
    );
end
fprintf("\n");