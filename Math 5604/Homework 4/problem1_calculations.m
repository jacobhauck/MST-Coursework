
k = (1/2).^(2:8);
y_ex = @(t) 1 ./ (1/2*t.^4 - t + 1);

errors = zeros(length(k), 4);

% Calculate errors
for i_k = 1:length(k)
    % TS2 method
    [t_ts2, y_ts2] = ts2(k(i_k));
    errors(i_k, 1) = abs(y_ts2(end) - y_ex(2));
    
    % TP method
    [t_tp, y_tp] = tp(k(i_k));
    errors(i_k, 2) = abs(y_tp(end) - y_ex(2));
    
    % AB2 method
    [t_ab2, y_ab2] = ab2(k(i_k));
    errors(i_k, 3) = abs(y_ab2(end) - y_ex(2));
    
    % MP method
    [t_mp, y_mp] = mp(k(i_k));
    errors(i_k, 4) = abs(y_mp(end) - y_ex(2));
end

% Display table
fprintf("\t\t\t\tTS2\t\t\t\t\t\t\t\tTP\t\t\t\t\t\t\t\tAB2\t\t\t\t\t\t\t\tMP\n");
fprintf("k\t\terror\t\t\trate\t\t\terror\t\t\trate\t\t\terror\t\t\trate\t\t\terror\t\t\trate\n");
fprintf("-------------------------------------------------------------------------------------------------------------------------------------\n");
fprintf( ...
    "1/4  \t%e\t-\t\t\t\t%e\t-\t\t\t\t%e\t-\t\t\t\t%e\t-\n", ...
    errors(1, 1), errors(1,2), errors(1, 3), errors(1, 4) ...
);
for i_k = 2:length(k)
    fprintf( ...
        "1/%d  \t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n", ...
        round(1/k(i_k)), ...
        errors(i_k, 1), log(errors(i_k, 1) / errors(i_k-1, 1)) / log(k(i_k) / k(i_k-1)), ...
        errors(i_k, 2), log(errors(i_k, 2) / errors(i_k-1, 2)) / log(k(i_k) / k(i_k-1)), ...
        errors(i_k, 3), log(errors(i_k, 3) / errors(i_k-1, 3)) / log(k(i_k) / k(i_k-1)), ...
        errors(i_k, 4), log(errors(i_k, 4) / errors(i_k-1, 4)) / log(k(i_k) / k(i_k-1)) ...
    );
end

loglog(k, errors(:, 1));
hold on;
plot(k, errors(:, 2));
plot(k, errors(:, 3));
plot(k, errors(:, 4));
legend("TS2", "TP", "AB2", "MP");