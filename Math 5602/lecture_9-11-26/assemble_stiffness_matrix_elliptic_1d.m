function A = assemble_stiffness_matrix_elliptic_1d()
    A = sparse(Nb, Nb);

    for n = 1:N
        for alpha = 1:N_lb
            for beta = 1:N_lb
                r = ;
                A(Tb(beta, n), Tb(alpha, n)) = A(Tb(beta, n), Tb(alpha, n)) + r;
            end
        end
    end
end