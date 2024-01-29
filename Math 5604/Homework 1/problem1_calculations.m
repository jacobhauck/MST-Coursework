% ===== Problem 1. =====

% === 1.2 (a) ===
% see main PDF and problem1_fe.m

% === 1.2 (b) === 
% What is the numerical value for y(2) when k = 1/32?
fprintf("Running problem 1.2 (b)\n");

% Run forward Euler scheme with k = 1/32.
[t, y] = problem1_fe(1/32);

% y(2) is the last value of y vector
fprintf("Numerical value of y(2) = %f\n", y(end));
fprintf("\n");

% === 1.2 (c) ===
% Plots
fprintf("Running problem 1.2 (c)\n");

% Run forward Euler schemes with k in {1/16, 1/64}
[t_fe16, y_fe16] = problem1_fe(1/16);
[t_fe64, y_fe64] = problem1_fe(1/64);

% Compute exact solution (see 1.1 from main PDF) on [0, 2]
t_ex = linspace(0, 2, 200);
y_ex = 3 + (t_ex - 2).*exp(-t_ex);

% Plot exact and numerical solutions
fig = figure();
plot( ...
    t_ex, y_ex, "black", ...
    t_fe16, y_fe16, "red", ...
    t_fe64, y_fe64, "blue" ...
);
legend("Exact", "k = 1/16", "k = 1/64");
fprintf("Saving plot to p1.2c.eps\n");
saveas(fig, "p1.2c.eps");
fprintf("\n");

% === 1.3 (a) ===
% see main PDF and problem1_be.m

% === 1.3 (b) === 
% What is the numerical value for y(2) when k = 1/32?
fprintf("Running problem 1.3 (b)\n");

% Run backward Euler scheme with k = 1/32.
[t, y] = problem1_be(1/32);

% y(2) is the last value of y vector
fprintf("Numerical value of y(2) = %f\n", y(end));
fprintf("\n");

% === 1.3 (c) ===
% Plots
fprintf("Running problem 1.3 (c)\n");

% Run backward Euler schemes with k in {1/16, 1/64}
[t_be16, y_be16] = problem1_be(1/16);
[t_be64, y_be64] = problem1_be(1/64);

% Reuse exact solution [t_ex, y_ex] from 1.2 (c)

% Plot exact and numerical solutions
fig = figure();
plot( ...
    t_ex, y_ex, "black", ...
    t_be16, y_be16, "red", ...
    t_be64, y_be64, "blue" ...
);
legend("Exact", "k = 1/16", "k = 1/64");
fprintf("Saving plot to p1.3c.eps\n");
saveas(fig, "p1.3c.eps");
fprintf("\n");

% === 1.4 ===
% Compute table values
fprintf("Running problem 1.4\n");

% Compute forward and backward Euler numerical solutions for
% k in {1/4, 1/8, 1/16, ..., 1/512}

% Get k values
k = (1/2).^(2:9);

% Create storage for table values
y_fe2 = zeros(1, size(k, 2));
y_be2 = zeros(1, size(k, 2));
y_ex2 = 3; % from 1.1

% Compute forward and backward Euler numerical solutions at t = 2
for i = 1:size(k, 2)
    % Forward Euler
    [t_fe, y_fe] = problem1_fe(k(i));
    y_fe2(i) = y_fe(end);

    % Backward Euler
    [t_be, y_be] = problem1_be(k(i));
    y_be2(i) = y_be(end);
end

% Display table
fprintf("Time step\tFE Error\tBE Error\n");
fprintf("--------------------------------\n")
for i = 1:size(k, 2)
    fprintf( ...
        "1/%d     \t%f\t%f\n", ...
        round(1/k(i)), abs(y_fe2(i) - y_ex2), abs(y_be2(i) - y_ex2) ...
    );
end
