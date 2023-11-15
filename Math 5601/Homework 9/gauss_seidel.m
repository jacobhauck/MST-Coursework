function [B, c] = gauss_seidel(A, b)

L_plus_D = tril(A);
U = A - L_plus_D;

B = -L_plus_D \ U;
c = L_plus_D \ b;