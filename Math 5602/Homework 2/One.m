function y = One(x)
    % Vectorized constant function
    %
    % Parameters
    % ----------
    %   x: (d, n) matrix of d-dimensional inputs
    %
    % Return
    % ------
    %   y: (1, n) ones

    y = ones(1, size(x, 2));
end