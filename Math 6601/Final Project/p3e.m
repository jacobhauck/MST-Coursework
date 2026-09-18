% Define variables
g = @(t) sin(2*pi*t);
t = p3_t(m);
t_test = p3_t(10*m);
g_value = g(t);
g_value_test = g(t_test);
lr = 0.01;
max_steps_gd = 100000;
print_steps_gd = 100000000000000000;
loss_cutoff_gd = 1e-2;

loss_cutoff_n = 1e-3;
max_steps_n = 4;
print_steps_n = 1000000000000;
tries = 1;

losses = zeros(6, 6);

i_m = 1;
for m = [10, 20, 40, 80, 160, 320]
    i_n = 1;
    for n = [10, 20, 40, 80, 160, 320]
        for attempt = 1:tries
            fprintf("Running m = %d and n = %d\n (attempt %d)\n", m, n, attempt);
            theta_gd = p3_gradient_descent(g_value, rand(3*n, 1), lr, max_steps_gd, print_steps_gd, loss_cutoff_gd);
            theta = p3_newton(g_value, theta_gd, max_steps_n, print_steps_n, loss_cutoff_n);
            fprintf("\n");
            value = p3_model(t_test, theta);
            loss = p3_loss(value, g_value_test);
            if loss < loss_cutoff_n
                break;
            end
        end
        losses(i_n, i_m) = loss;
        i_n = i_n + 1;
        if loss >= loss_cutoff_n
            fprintf("Failed m = %d and n = %d\n", m, n);
        end
    end
    i_m = i_m + 1;
end