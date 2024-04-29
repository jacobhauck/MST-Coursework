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
    
    xx, yy = meshgrid(x, y);
    u = zeros(N+1, M+1, M+1);

end

function result = vd5(z, M, h)
    % z(m(i-1,j))
    left = zeros((M+1)^2, 1);
    left(1+(M+1) : end) = z(1 : end-(M+1));
    left(1 : M+1) = z(end-(M+1) : end);
    
    % z(m(i+1,j))
    right = zeros((M+1)^2, 1);
    right(1 : end-(M+1)) = z(1+(M+1) : end);
    right(end-(M+1) : end) = z(1 : M+1);
    
    % z(m(i,j-1))
    % This is a bit trickier -- if m = 1 mod (M+1), then we need down(m) =
    % z((m-1) + (M+1)), otherwise we need down(m) = z(m-1).
    down = zeros((M+1)^2, 1);
    % Shift *all* indices by 1
    down(2:end) = z(1:end-1);
    % Now correct indices m where m = 1 mod (M+1)
    down(1 : (M+1) : end) = z(M : (M+1) : end);

    % z(m(i,j+1))
    % Now if m = (M+1) mod (M+1), we need up(m) = z((m+1) - (M+1)),
    % otherwise up(m) = z(m+1)
    up = zeros((M+1)^2, 1);
    % Shift *all* indices by 1
    up(1:end-1) = z(2:end);
    % Now correct indices m where m = (M+1) mod (M+1)
    up(M+1 : M+1 : end) = z(1 : (M+1) : end);

    % Add everything up
    result = (left + right + up + down - 4*z) / h^2;
end

