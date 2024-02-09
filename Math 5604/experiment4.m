% interval = [0, 1]

k = 1/64;
n = ceil(1 / k);

t = linspace(0, 1, n + 1);
x_vec = zeros(2, n + 1);

x_vec_ex = zeros(2, n + 1);
x_vec_ex(1, :) = exp(-2*t) .* cos(t);
x_vec_ex(2, :) = -exp(-2*t) .* sin(t);

x_vec(1, 1) = 1;  % x^0 = 1
x_vec(2, 1) = 0;  % y^0 = 1

mat = [1 + 2*k, -k; k, 1 + 2*k];

for i = 1:n
    x_vec(:, i + 1) = mat \ x_vec(:, i);
end

hold on;
plot(t, x_vec_ex(1, :));
plot(t, x_vec(1, :));