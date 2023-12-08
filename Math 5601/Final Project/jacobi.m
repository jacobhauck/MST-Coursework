function [B, c] = jacobi(A, b)

d = diag(A);
N = diag(d) - A;
M_inv = diag(1 ./ d);

c = M_inv * b;
B = M_inv * N;