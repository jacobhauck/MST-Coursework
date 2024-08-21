y_ex = @(x) x.^3 .* (1-x);

h = (1/2).^(1:8);

error_table = table( ...
    'Size', [length(h) 3], ...
    'VariableTypes', ["string", "double", "double"], ...
    'VariableNames', ["h", "error", "rate"] ...
);
for i_h = 1:length(h)
    % Solve for current h
    [x_i, y_i] = solve_bvp_center(h(i_h));

    % Update table
    error_table(i_h, 1) = {sprintf("1/%d", round(1/h(i_h)))};
    error_table(i_h, 2) = {sqrt(h(i_h)) * norm(y_ex(x_i) - y_i)};
    if i_h > 1
        error_table(i_h, 3) = {log(error_table{i_h, 2}/error_table{i_h-1, 2}) / log(h(i_h)/h(i_h-1))};
    end
end

% Plot last numerical solution and exact solution
plot(x_i, y_ex(x_i));
hold on;
plot(x_i, y_i);
hold off;

function [x, y] = solve_bvp_center(h)
    % Solve
    %   y'' + sin(y) = sin(x^3(1-x)) + 6x(1-2x)
    %   y(0) = 0, y'(1) = -1
    % on [0,1] using centered difference schemes.
    % Exact solution is y(x) = x^3(1-x).
    %
    % Parameters
    % ----------
    %   h: distance between sample nodes
    %
    % Return
    % ------
    %   x: vector of n+1 sample nodes, where n = ceil(1/h)
    %   y: vector of n+1 numerical solution values at x

    % Initialization
    n = ceil(1/h);
    x = linspace(0, 1, n+1)';
    g = @(x) sin(x.^3 .* (1-x)) + 6*x .* (1-2*x);
    
    % unknown points start from second point because of Dirichlet BC on
    % left
    x_uk = x(2:end);
    g_x_uk = g(x_uk);

    % Newton's method to solve system for y excluding the left boundary
    % Initial guess is y^0(x) = -x, as this satisfies the BCs
    y_uk = newton( ...
        @(y_) newton_f(y_, h, g_x_uk), ... % F(y)
        @(y_) newton_f_prime(y_, h), ...   % DF(y)
        -x_uk, ...                         % y^0
        100, 1e-8, 0, 0 ...                % max_iter, tol, tol_f, tol_f_prime
    );

    % Construct full solution by prepending left BC
    y = zeros(n+1, 1);
    y(1) = 0;
    y(2:end) = y_uk;
end

function f = newton_f(y, h, g_x)
    % F(y) for Newton's method
    %
    % Parameters
    % ----------
    %   y: vector [y_1, y_2, ..., y_N] current Newton iterate (note
    %       exclusion of leftmost point due to BC)
    %   h: step size
    %   g_x: vector [g(x_1), g(x_2), ..., g(x_N)], forcing term evaluated
    %       at the sample points (note starting from second point x_1, not
    %       x_0)
    %
    % Return
    % ------
    %   f: vector [f_1(y), f_2(y), ..., f_N(y)], next Newton iterate
    f = sin(y) - g_x;
    f(1) = f(1) + (-2*y(1) + y(2)) / h^2;
    f(2:end-1) = f(2:end-1) + (y(1:end-2) - 2*y(2:end-1) + y(3:end)) / h^2;
    f(end) = f(end) + (2*y(end-1) - 2*y(end)) / h^2 - 2/h;
end

function df = newton_f_prime(y, h)
    % DF(y) for Newton's method
    %
    % Parameters
    % ----------
    %   y: vector [y_1, y_2, ..., y_N] current Newton iterate (note
    %       exclusion of leftmost point due to BC)
    %   h: step size
    %
    % Return
    % ------
    %   df: Jacobian matrix of F at y: DF(y) (this should be N x N)
    off_diag = 1/h^2 * ones(length(y) - 1, 1);
    df = diag(off_diag, 1) + diag(-2/h^2 + cos(y), 0) + diag(off_diag, -1);

    df(end, end-1) = 2/h^2;
end