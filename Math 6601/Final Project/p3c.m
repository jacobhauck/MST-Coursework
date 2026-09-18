% Define variables
g = @(t) sin(2*pi*t);
n = 10;
m = 10;
t = p3_t(m);
g_value = g(t);
lr = 0.5;
max_steps = 100;
print_steps = 5;
loss_cutoff = 1e-2;

theta = p3_gradient_descent(g_value, rand(3*n, 1), lr, max_steps, print_steps, loss_cutoff);

t_plot = linspace(0, 1, 500)';
fprintf("Max error = %.06e\n", max(abs(p3_model(t_plot, theta) - g(t_plot))));
hold on;
plot(t_plot,p3_model(t_plot, theta));
plot(t_plot, g(t_plot));
