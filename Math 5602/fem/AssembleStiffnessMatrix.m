function A = AssembleStiffnessMatrix(bilinear, trial_elements, test_elements)
    % Assemble finite element stiffness matrix for an given bilinear form
    %
    % Parameters
    % ----------
    %   bilinear: Callable implementing a bilinear form
    %   trial_elements: Finite element basis object for trial function
    %   test_elements: Finite element basis object for test function
    %
    % Return
    % ------
    %   A: (Nb, Nb) stiffness matrix of the
    %      equation using the given finite element discretization
    %
    
    mesh = test_elements.mesh;
    
    % Assemble A
    A = sparse(test_elements.Nb, trial_elements.Nb);
    for n = 1 : mesh.N
        x = mesh.P(:, mesh.T(:, n));
        for alpha = 1 : trial_elements.N_lb
            i = trial_elements.Tb(alpha, n);
            for beta = 1 : test_elements.N_lb
                j = test_elements.Tb(beta, n);
                val = bilinear(trial_elements, alpha, test_elements, beta, n, x);
                A(j, i) = A(j, i) + val;
            end
        end
    end
end