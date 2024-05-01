function [t, x, y, u] = ac_convex_splitting(u0, eps, N, T, M)
    % Solve the Allen-Cahn equation
    %   u_t = u_xx + u_yy - eps^2 u(1-u^2),   t > 0, 0 < x < 2pi, 0 < y < 2pi;
    %   u(0, x, y) = u0(x, y),   0 <= x <= 2pi, 0 <= y <= 2pi;
    %   u(t, x, 0) = u(t, x, 2pi)  0 <= x <= 2pi, t >= 0;
    %   u(t, 0, y) = u(t, 2pi, y)  0 <= y <= 2pi, t >= 0
    % on the square [0, 2pi]^2 for t in [0, T] using the convex splitting
    % method for time-stepping.
    %
    % Parameters
    % ----------
    %   - u0: a function u0(x, y) that gives the initial condition
    %   - eps: epsilon parameter in equation
    %   - N: number of sample intervals in t direction
    %   - T: stopping time
    %   - M: number of sample intervals in x and y directions
    %
    % Return
    % ------
    %   - t: N + 1 time sample points
    %   - x: M + 1 x sample points
    %   - y: M + 1 y sample points
    %   - u: (N+1, M+1, M+1) solution values at the sample points
    
    % Initialization
    t = linspace(0, T, N+1);
    k = T/N;
    
    x = linspace(0, 2*pi, M+1);
    y = linspace(0, 2*pi, M+1);
    h = 2*pi/M;
    
    [xx, yy] = meshgrid(x, y);
    u = zeros(N+1, M+1, M+1);
    u(1, :, :) = u0(xx, yy);

    for i = 1:N
        vui = v(u(i, :, :), M);
        f_i = @(z) newton_f(z, M, h, k, eps, vui);
        df_i = @(z) newton_f_prime(z, M, h, k, eps);
        u(i+1, :, :) = v_inv(newton(f_i, df_i, vui, 100, 1e-8, 0, 0), M);
    end
end

function f = newton_f(z, M, h, k, eps, vun)
    f = z - (k*eps^2)*vd5(z, M, h) + k*z.^3 - (1+k)*vun;
end

function df = newton_f_prime(z, M, h, k, eps)
    diag_part = sparse(1:(M+1)^2, 1:(M+1)^2, ones((M+1)^2,1) + 3*k*z.^2);
    df = diag_part - (k*eps^2)*dvd5(M, h);
end

function result = v(a, M)
    % Implementation of V function. MATLAB reshape function is all that's
    % needed
    result = reshape(a, (M+1)^2, 1);
end

function result = v_inv(b, M)
    % Implementation of V^{-1}. Again, just use reshape
    result = reshape(b, M+1, M+1);
end

