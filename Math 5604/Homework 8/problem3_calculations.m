% ===== Problem 3 ======

%% === (c) ===
% Make a mesh plot of the solution and the error function.
fprintf("Begin problem 3 (c)\n");

% Domain is [0,1]^2, so M = N = 128 => h_x = h_y = 1/128
[x, y, u] = problem3(128, 128);

% Note that we have used the convention y-axis <-> rows, so our solution
% is compatible with meshgrid.
[xx, yy] = meshgrid(x, y);
u_ex = sin(pi*(xx + yy));

figure;
mesh(xx, yy, u);

figure;
mesh(xx, yy, abs(u-u_ex));
fprintf("\n\n");


%% === (d) ===
% Calculate 2 and infinity norm errors for various values of h.
fprintf("Begin problem 3 (d)\n");

h = (1/2).^(3:8);

fprintf("h\t\tinf err\t\t\tinf rate\t2 err\t\t\t2 rate\n");
fprintf("------------------------------------------------------------\n");
last_inf_error = 0;
last_l2_error = 0;
for i_h = 1:length(h)
    [x, y, u] = problem3(round(1/h(i_h)), round(1/h(i_h)));
    [xx, yy] = meshgrid(x, y);
    u_ex = sin(pi*(xx + yy));

    inf_error = max(max(abs(u - u_ex)));
    l2_error = norm(u - u_ex) * h(i_h);

    inf_rate = "-        ";
    l2_rate = "-        ";
    if i_h > 1
        inf_rate = sprintf("%f", log(inf_error / last_inf_error) / log(h(i_h) / h(i_h-1)));
        l2_rate = sprintf("%f", log(l2_error / last_l2_error) / log(h(i_h) / h(i_h-1)));
    end
    last_inf_error = inf_error;
    last_l2_error = l2_error;
    fprintf("1/%d  \t%e\t%s\t%e\t%s\n", round(1/h(i_h)), inf_error, inf_rate, l2_error, l2_rate);
end
fprintf("\n");
