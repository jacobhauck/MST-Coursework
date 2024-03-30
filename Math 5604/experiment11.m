% Numerical solution of BVP
%   u'' - u = -sin(2pi x), 0 < x < 1
%   u(0) = 0 = u(1)

% initialization
h = 1/32;
n = ceil(1/h);
x = linspace(0, 1, n + 1)';

% create matrix and vector storage
A = zeros(n-1, n-1);
b = zeros(n-1, 1);

% first row
A(1, 1) = -1 - 2/h^2;
A(1, 2) = 1/h^2;
b(1) = 0;  % = -sin(2pi*0) - 0/h^2

% last row
A(n-1, n-2) = 1/h^2;
A(n-1, n-1) = -1 - 2/h^2;
b(n-1) = 0;  % = -sin(2pi*1) - 0/h^2

% interior rows
for r = 2:(n-2)
    A(r, r-1) = 1/h^2;
    A(r, r) = -1 - 2/h^2;
    A(r, r+1) = 1/h^2;

    % row r <-> index r+1
    b(r) = -sin(2*pi*x(r+1));
end

% solve on interior
u_int = A \ b;

% construct full solution with BCs
u = zeros(n + 1, 1);
u(2:end-1) = u_int;
u(1) = 0;
u(end) = 0;

% exact solution
u_ex = sin((2*pi).*x) ./ (1 + 4*pi^2);

% print L^infty error
fprintf("L^infty error: %e\n", max(abs(u - u_ex)));

% Display approximate and exact solutions
plot(x, u);
hold on;
plot(x, u_ex);
