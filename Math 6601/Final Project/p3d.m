% Define variables
g = @(t) t.*(1-t);
n = 10;
m = 10;
t = p3_t(m);
g_value = g(t);
lr = 0.01;
max_steps_gd = 100000;
print_steps_gd = 1000;
loss_cutoff_gd = 1e-2;

theta_gd = p3_gradient_descent(g_value, rand(3*n, 1), lr, max_steps_gd, print_steps_gd, loss_cutoff_gd);
t_plot = linspace(0, 1, 500)';
fprintf("Max error = %.06e\n\n\n", max(abs(p3_model(t_plot, theta_gd) - g(t_plot))));
close all;
hold on;
plot(t_plot,p3_model(t_plot, theta_gd));
plot(t_plot, g(t_plot));
scatter(t, g(t));

loss_cutoff = 1e-4;
max_steps = 5;
print_steps = 1;

theta = p3_newton(g_value, theta_gd, max_steps, print_steps, loss_cutoff);
t_plot = linspace(0, 1, 500)';
fprintf("Max error = %.06e\n", max(abs(p3_model(t_plot, theta) - g(t_plot))));

plot(t_plot,p3_model(t_plot, theta));
legend("GD", "True", "Pts", "N");
