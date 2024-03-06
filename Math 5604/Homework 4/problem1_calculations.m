% ===== Problem 1 =====

% Define exact solution
y_ex = @(t) 1 ./ (1/2*t.^4 - t + 1);

%% === (a) ===
% Solve the equation numerically using the TS2 method
fprintf("Running problem 1 (a)\n");
[t_ts2, y_ts2] = ts2(1/512);

%% === (b) ===
% Solve the equation numerically using the AB2 method
fprintf("Running problem 1 (b)\n");
[t_ab2, y_ab2] = ab2(1/512);

%% === (c) ===
% Solve the equation numerically using the trapezoidal method
fprintf("Running problem 1 (c)\n");
[t_tp, y_tp] = tp(1/512);

%% === (d) ===
% Solve the equation numerically using the midpoint method
fprintf("Running problem 1 (d)\n");
[t_mp, y_mp] = mp(1/512);

%% === (e) ===
% Create table of errors and convergence rates
fprintf("Running problem 1 (e)\n");

% Set k values
k = (1/2).^(2:8);

% Allocate storage for errors
i_ts2 = 1;
i_tp = 2;
i_ab2 = 3;
i_mp = 4;
errors = zeros(length(k), 4);

% Calculate errors
for i_k = 1:length(k)
    % TS2 method
    [t_ts2, y_ts2] = ts2(k(i_k));
    errors(i_k, i_ts2) = abs(y_ts2(end) - y_ex(2));
    
    % TP method
    [t_tp, y_tp] = tp(k(i_k));
    errors(i_k, i_tp) = abs(y_tp(end) - y_ex(2));
    
    % AB2 method
    [t_ab2, y_ab2] = ab2(k(i_k));
    errors(i_k, i_ab2) = abs(y_ab2(end) - y_ex(2));
    
    % MP method
    [t_mp, y_mp] = mp(k(i_k));
    errors(i_k, i_mp) = abs(y_mp(end) - y_ex(2));
end

% Display table
fprintf("\t\t\t\tTS2\t\t\t\t\t\t\t\tTP\t\t\t\t\t\t\t\tAB2\t\t\t\t\t\t\t\tMP\n");
fprintf("k\t\terror\t\t\trate\t\t\terror\t\t\trate\t\t\terror\t\t\trate\t\t\terror\t\t\trate\n");
fprintf("-------------------------------------------------------------------------------------------------------------------------------------\n");
fprintf( ...
    "1/4  \t%e\t-\t\t\t\t%e\t-\t\t\t\t%e\t-\t\t\t\t%e\t-\n", ...
    errors(1, i_ts2), errors(1,i_tp), errors(1, i_ab2), errors(1, i_mp) ...
);
for i_k = 2:length(k)
    fprintf( ...
        "1/%d  \t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n", ...
        round(1/k(i_k)), ...
        errors(i_k, i_ts2), log(errors(i_k, i_ts2) / errors(i_k-1, i_ts2)) / log(k(i_k) / k(i_k-1)), ...
        errors(i_k, i_tp), log(errors(i_k, i_tp) / errors(i_k-1, i_tp)) / log(k(i_k) / k(i_k-1)), ...
        errors(i_k, i_ab2), log(errors(i_k, i_ab2) / errors(i_k-1, i_ab2)) / log(k(i_k) / k(i_k-1)), ...
        errors(i_k, i_mp), log(errors(i_k, i_mp) / errors(i_k-1, i_mp)) / log(k(i_k) / k(i_k-1)) ...
    );
end
fprintf("\n");

%% === (f) ===
% Create log-log plot with errors from all three methods
fprintf("Running problem 1 (f)\n");

fig = figure;
loglog(k, errors(:, i_ts2));
hold on;
plot(k, errors(:, i_tp));
plot(k, errors(:, i_ab2));
plot(k, errors(:, i_mp));
plot(k, 5*k.^2, "--");
xlabel("k");
ylabel("Error at t = 2");
legend({"TS2", "TP", "AB2", "MP", "k^2"}, "Location", "northwest");
hold off;
saveas(fig, "p1f_plot.eps", "epsc");

fprintf("\n");
