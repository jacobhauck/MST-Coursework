function x = gauss_elim(A, b)
% Solve Ax = b using Gaussian elimination without pivoting.

n = length(b);

% Elimination phase
for k = 1 : (n-1)
    for i = (k+1) : n
        m = A(i, k) / A(k, k);
        A(i, k:end) = A(i, k:end) - m * A(k, k:end);
        b(i) = b(i) - m * b(k);
    end
end

% Substitution phase
x = zeros(n, 1);
x(n) = b(n) / A(n, n);
for k = (n-1) : -1 :  1
    row_k = A(k, :);
    x(k) = (b(k) - row_k((k+1) : end) * x((k+1) : end)) / A(k, k);
end
