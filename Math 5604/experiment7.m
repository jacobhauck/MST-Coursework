
% Get a range of k values
k = (1/2).^(2:9);

% Allocate storage for errors at t = 1
errors_ts2 = zeros(1, length(k));
errors_ts3 = zeros(1, length(k));

% Compute errors
for i_k = 1:length(k)
    % Get numerical solutions using TS2 and TS3 with current k value
    [t_ts2, x_ts2] = ts2(k(i_k));
    [t_ts3, x_ts3] = ts3(k(i_k));

    % Get exact solution (t_ts2 == t_ts3, so just use t_ts2)
    x_ex = t_ts2.^5;
    
    % Calculate error at t = 1
    errors_ts2(i_k) = abs(x_ts2(end) - x_ex(end));
    errors_ts3(i_k) = abs(x_ts3(end) - x_ex(end));
end

% Display error table with convergence rates
fprintf("k   \terror ts2\trate ts2\terror ts3\trate ts3\n");
fprintf("----------------------------------------------------\n")
fprintf("1/%d  \t%f\t-        \t%f\t-\n", round(1/k(1)), errors_ts2(1), errors_ts3(1));
for i_k = 2:length(k)
    fprintf("1/%d  \t%f\t%f\t%f\t%f\n", ...
        round(1/k(i_k)), ...
        errors_ts2(i_k), ...
        log(errors_ts2(i_k) / errors_ts2(i_k - 1)) / log(k(i_k) / k(i_k - 1)), ...
        errors_ts3(i_k), ...
        log(errors_ts3(i_k) / errors_ts3(i_k - 1)) / log(k(i_k) / k(i_k - 1)) ...
    );
end
