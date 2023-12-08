function [x, u] = fem_dirichlet_1d( ...
    a, b, ga, gb, c, f, n, integrator, solver ...
)

% Initialization
h = (b - a) / n;
x = linspace(a, b, n + 1);

A = zeros(n + 1, n + 1);
b_load = zeros(n + 1, 1);

% Compute integral of c(x) over each element
c_int = zeros(n, 1);
for j = 1:n
    c_int(j) = integrator(c, x(j), x(j + 1)) / h^2;
end

% Assemble stiffness matrix (no BC)
for j = 1:n
    A(j + 1, j) = c_int(j);
    A(j, j + 1) = c_int(j);
end

for j = 2:n
    A(j, j) = -c_int(j - 1) - c_int(j);
end

% Assemble load vector (no BC)
for j = 2:n
    b_load(j) = integrator( ...
        @(y) f(y) .* (y - x(j - 1)) / h, ...
        x(j - 1), x(j) ...
    );
    b_load(j) = b_load(j) + integrator( ...
        @(y) f(y) .* (x(j + 1) - y) / h, ...
        x(j), x(j + 1) ...
    );
end

% Enforce Dirichlet BC
A(1, :) = 0;
A(1, 1) = 1;
A(n + 1, :) = 0;
A(n + 1, n + 1) = 1;

b_load(1) = ga;
b_load(n + 1) = gb;

% Solve
u = solver(A, b_load)';
