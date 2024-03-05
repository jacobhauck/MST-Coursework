
k = [0.4, 0.2, 0.1, 0.05];

eta = 1;
lambda = -1e6;
y_ex = @(t) exp(lambda.*t).*(eta - cos(t)) + cos(t);

fe_error = zeros(1, length(k));
be_error = zeros(1, length(k));
trap_error = zeros(1, length(k));

for i_k = 1:length(k)
    [t_fe, y_fe] = fe(k(i_k), lambda, eta);
    fe_error(i_k) = abs(y_ex(2) - y_fe(end));

    [t_be, y_be] = be(k(i_k), lambda, eta);
    be_error(i_k) = abs(y_ex(2) - y_be(end));

    [t_trap, y_trap] = trap(k(i_k), lambda, eta);
    trap_error(i_k) = abs(y_ex(2) - y_trap(end));
end

fprintf("Error at t = 2, eta=%f, lambda=%f\n", eta, lambda);
fprintf("k\t\t\tFE\t\t\t\tBE\t\t\t\tTrap\n");
for i_k = 1:length(k)
    fprintf("%f\t%e\t%e\t%e\n", k(i_k), fe_error(i_k), be_error(i_k), trap_error(i_k));
end
fprintf("\n");

plot(t_be, abs(y_be - y_ex(t_be)));
hold on;
plot(t_trap, abs(y_trap - y_ex(t_trap)));
hold off;

eta = 1.5;
lambda = -1e6;
y_ex = @(t) exp(lambda.*t).*(eta - cos(t)) + cos(t);

fe_error = zeros(1, length(k));
be_error = zeros(1, length(k));
trap_error = zeros(1, length(k));

for i_k = 1:length(k)
    [t_fe, y_fe] = fe(k(i_k), lambda, eta);
    fe_error(i_k) = abs(y_ex(2) - y_fe(end));

    [t_be, y_be] = be(k(i_k), lambda, eta);
    be_error(i_k) = abs(y_ex(2) - y_be(end));

    [t_trap, y_trap] = trap(k(i_k), lambda, eta);
    trap_error(i_k) = abs(y_ex(2) - y_trap(end));
end

fprintf("Error at t = 2, eta=%f, lambda=%f\n", eta, lambda);
fprintf("k\t\t\tFE\t\t\t\tBE\t\t\t\tTrap\n");
for i_k = 1:length(k)
    fprintf("%f\t%e\t%e\t%e\n", k(i_k), fe_error(i_k), be_error(i_k), trap_error(i_k));
end
fprintf("\n");

plot(t_be, abs(y_be - y_ex(t_be)));
hold on;
plot(t_trap, abs(y_trap - y_ex(t_trap)));
hold off;

function [t, y] = fe(k, lambda, eta)
    n = ceil(2/k);
    t = linspace(0, 2, n + 1);
    y = zeros(1, n + 1);

    y(1) = eta;
    for i = 1:n
        y(i + 1) = y(i) + k*(lambda*(y(i) - cos(t(i))) - sin(t(i)));
    end
end

function [t, y] = be(k, lambda, eta)
    n = ceil(2/k);
    t = linspace(0, 2, n + 1);
    y = zeros(1, n + 1);

    y(1) = eta;
    for i = 1:n
        y(i + 1) = (y(i) - k*(lambda * cos(t(i + 1)) + sin(t(i + 1)))) / (1 - k*lambda);
    end
end

function [t, y] = trap(k, lambda, eta)
    n = ceil(2/k);
    t = linspace(0, 2, n + 1);
    y = zeros(1, n + 1);

    y(1) = eta;
    for i = 1:n
        y(i + 1) = (y(i) + k*(lambda*(y(i) - cos(t(i))) - sin(t(i)))/2 - k*(lambda*cos(t(i + 1)) + sin(t(i + 1)))/2) / (1 - k*lambda/2);
    end
end