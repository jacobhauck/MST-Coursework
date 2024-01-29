% ===== Problem 2. ======

% === 2.2 ===
% see main pdf and problem2_be.m

% === 2.3 ===
% What is the numerical value of y(1) when k = 1/32 and eps = 0.1?
fprintf("Running problem 2.3\n");

% Run backward Euler scheme with required parameters
[t, y] = problem2_be(1/32, 0.1);

% Numerical approximation of y(1) is the last value returned in y
fprintf("Numerical value of y(1) = %f\n", y(end));

fprintf("\n");

% === 2.4 ===
% What is the numerical value of y(1) when k = 1/32 and eps = 1e-8?
fprintf("Running problem 2.4\n");

% Run backward Euler scheme with required parameters
[t, y] = problem2_be(1/32, 1e-8);

% Numerical approximation of y(1) is the last value returned in y
fprintf("Numerical value of y(1) = %f\n", y(end));

fprintf("\n");

% === 2.5 ===
% Compute table values
fprintf("Running problem 2.5\n");

% Get k values and eps values
k = (1/2).^(2:9);
eps = [0.1, 1e-3, 1e-8];

% Get true value of y(1) from analytical solution
y_ex = @(t) -1 - sqrt(t^3 + 5*t^2 + t + 1);
y_ex1 = y_ex(1);

% Create storage for table: num k values by num eps values
error_table = zeros(size(k, 2), size(eps, 2));

% Run backward Euler scheme for every k and eps value and calculate error
for i_k = 1:size(k, 2)
    for i_eps = 1:size(eps, 2)
        [t, y] = problem2_be(k(i_k), eps(i_eps));
        error_table(i_k, i_eps) = abs(y(end) - y_ex1);
    end
end

% Display table
fprintf("Time step\teps = 0.1 error\t\teps = 1e-3 error\teps=1e-8 error\n");
fprintf("------------------------------------------------------------------\n");
for i = 1:size(k, 2)
    fprintf( ...
        "1/%d      \t%f\t\t\t%f\t\t\t%f\n", ...
        round(1/k(i)), ...
        error_table(i, 1), error_table(i, 2), error_table(i, 3) ...
    );
end

fprintf("\n");
