function [B, c] = jacobi(A, b)

d = diag(A);
N = A - diag(d);

c = N * b;
B = diag(1 ./ d) * N;