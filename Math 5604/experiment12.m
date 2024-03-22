% Numerical solution of BVP
%   eps u'' - x^2u' - u = 0, 0 < x < 1
%   u(0) = 1 = u(1)

% solve numerically
[x, u] = solve_exp12(1/512, .1);

% Display approximate solution
plot(x, u);

function [x, u] = solve_exp12(h, eps)
    % initialization
    n = ceil(1/h);
    x = linspace(0, 1, n + 1)';
    
    % create matrix and vector storage
    A = zeros(n-1, n-1);
    b = zeros(n-1, 1);
    
    % first row
    A(1, 1) = -1 - 2*eps/h^2;
    A(1, 2) = eps/h^2 - x(2)^2/(2*h);
    b(1) = -eps/h^2 - x(2)^2/(2*h);  % = 0 - u_0*(eps/h^2 + x_1^2/2h)
    
    % last row
    A(n-1, n-2) = eps/h^2 + x(n)^2/(2*h);
    A(n-1, n-1) = -1 - 2*eps/h^2;
    b(n-1) = -eps/h^2 + x(n)^2/(2*h);  % = 0 - u_0*(eps/h^2 - x_{n-1}^2/2h)
    
    % interior rows
    for r = 2:(n-2)
        % row r <-> index r+1
        A(r, r-1) = eps/h^2 + x(r+1)^2/(2*h);
        A(r, r) = -2*eps/h^2 - 1;
        A(r, r+1) = eps/h^2 - x(r+1)^2/(2*h);
    
        b(r) = 0;
    end
    
    % solve on interior
    u_int = A \ b;
    
    % construct full solution with BCs
    u = zeros(n + 1, 1);
    u(2:end-1) = u_int;
    u(1) = 1;
    u(end) = 1;
end
