function y = Zero(x)
    % Vectorized zero function
    %
    % Parameters
    % ----------
    %   x: (d, n) matrix of d-dimensional inputs
    %
    % Return
    % ------
    %   y: (1, n) zeros
    
    y = zeros(1, size(x, 2));
end