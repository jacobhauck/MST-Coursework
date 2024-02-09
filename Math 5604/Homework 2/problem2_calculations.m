% ===== Problem 2 =====

% === 2.1 ===

%% 2.1 (a)
% What is the numerical value for y(2) (using theta = 1)
fprintf("Running problem 2.1 (a)\n");

% make sure theta = 1
theta = 1;

% Use k = 1/2048 for consistency with the reference solution used later
[t, y] = problem2(1/2048, theta);

fprintf("Numerical value of y(2) = %f\n", y(end));
fprintf("\n");

%% 2.1 (b)
% Numerical errors at t = 2 for a range of time steps
fprintf("Running problem 2.1 (b)\n");

% make sure theta = 1
theta = 1;

% Get reference solution (k = 1/2048)
[t_ref, y_ref] = problem2(1/2048, theta);

% Get numerical solutions at t = 2 for range of time steps
k = (1/2).^(4:9);
y_at_2 = zeros(1, length(k));


for i_k = 1:length(k)
    [t, y] = problem2(k(i_k), theta);
    y_at_2(i_k) = y(end);
end

% Display table
fprintf("Time step\tError at t = 2\n");
fprintf("--------------------------------\n");
for i_k = 1:length(k)
    fprintf("1/%d  \t%f\n", round(1/k(i_k)), abs(y_at_2(i_k) - y_ref(end)));
end
fprintf("\n");

%% 2.1 (c)
% Find the order of convergence based on the results of (b).


% === 2.2 ===

%% 2.2 (a)
% What is the numerical value for y(2) (using theta = 1/2)

% What is the numerical value for y(2) (using theta = 1)
fprintf("Running problem 2.2 (a)\n");

% make sure theta = 1/2
theta = 1/2;

% Use k = 1/2048 for consistency with the reference solution used later
[t, y] = problem2(1/2048, theta);

fprintf("Numerical value of y(2) = %f\n", y(end));
fprintf("\n");

%% 2.2 (b)
% Numerical errors at t = 2 for a range of time steps
fprintf("Running problem 2.2 (b)\n");

% make sure theta = 1/2
theta = 1/2;

% Get reference solution (k = 1/2048)
[t_ref, y_ref] = problem2(1/2048, theta);

% Get numerical solutions at t = 2 for range of time steps
k = (1/2).^(4:9);
y_at_2 = zeros(1, length(k));


for i_k = 1:length(k)
    [t, y] = problem2(k(i_k), theta);
    y_at_2(i_k) = y(end);
end

% Display table
fprintf("Time step\tError at t = 2\n");
fprintf("--------------------------------\n");
for i_k = 1:length(k)
    fprintf("1/%d  \t%e\n", round(1/k(i_k)), abs(y_at_2(i_k) - y_ref(end)));
end
fprintf("\n");

%% 2.2 (c)
% Find the order of convergence based on the results of (b).
