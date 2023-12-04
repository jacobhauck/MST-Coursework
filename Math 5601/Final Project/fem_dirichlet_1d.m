function [v_x, v_u] = fem_dirichlet_1d(a, b, ga, gb, c, f, n, integrator, solver)

% Initialization
h = (b - a) / n;

v_x = linspace(a, b, n + 1);

m_A = sparse(n + 1, n + 1);
v_b = zeros(n + 1, 1);

% Compute integral of c(x) over each element
v_c_int = zeros(n, 1);
for j = 1:n
    v_c_int(j) = integrator(c, v_x(j), v_x(j + 1)) / h^2;
end

% Assemble stiffness matrix (no BC)
for j = 1:n
    m_A(j + 1, j) = v_c_int(j);
    m_A(j, j + 1) = v_c_int(j);
end

for j = 2:n
    m_A(j, j) = -v_c_int(j - 1) - v_c_int(j);
end

m_A(1, 1) = -v_c_int(1);
m_A(n + 1, n + 1) = -v_c_int(n);

% Enforce Dirichlet BC
m_A(1, :) = 0;
m_A(1, 1) = 1;
m_A(n + 1, :) = 0;
m_A(n + 1, n + 1) = 1;

% Assemble load vector (no BC)
for j = 2:n
    v_b(j) = integrator(@(x) f(x) .* (x - v_x(j - 1)) / h, v_x(j - 1), v_x(j));
    v_b(j) = v_b(j) + integrator(@(x) f(x) .* (v_x(j + 1) - x) / h, v_x(j), v_x(j + 1));
end

v_b(1) = integrator(@(x) f(x) .* (x - v_x(1)) / h, v_x(1), v_x(2));
v_b(n + 1) = integrator(@(x) f(x) .* (v_x(n + 1) - x) / h, v_x(n), v_x(n + 1));

v_b(1) = ga;
v_b(n + 1) = gb;

% Solve
v_u = solver(m_A, v_b)';
