function [A, b] = Assemble1d(problem, trial_elements, test_elements)
    % Assemble finite element stiffness matrix and load vector for 1D 
    % equation in the weak formulation
    %
    %     problem.Bilinear(u, phi) = problem.Linear(phi) for all phi in H
    %
    % Parameters
    % ----------
    %   problem: Problem object with callable Bilinear and Linear functions
    %            that define the problem in the weak formulation
    %   trial_elements: Finite element basis object for trial function
    %   test_elements: Finite element basis object for test function
    %
    % Return
    % ------
    %   A: (Nb, Nb) stiffness matrix of the elliptic
    %      equation using the given finite element discretization
    %   b: (Nb, 1) load vector of the equation using the given
    %      finite element discretization
    %

    % Validate input
    mesh = test_elements.mesh;
    if mesh ~= trial_elements.mesh
        error("Test and trial elements must be defined on the same mesh");
    end
    
    % Check numbers of trial and test basis functions match
    Nb = test_elements.Nb;
    if Nb ~= trial_elements.Nb
        error("Dimension of trial space must equal dimension of test space");
    end
    
    % Assemble A
    A = sparse(Nb, Nb);
    for n = 1 : mesh.N
        x = mesh.P(:, mesh.T(:, n));
        for alpha = 1 : trial_elements.N_lb
            i = trial_elements.Tb(alpha, n);
            for beta = 1 : test_elements.N_lb
                j = test_elements.Tb(beta, n);
                val = problem.Bilinear(trial_elements, alpha, test_elements, beta, n, x);
                A(j, i) = A(j, i) + val;
            end
        end
    end

    % Assemble b
    b = zeros(Nb, 1);
    for n = 1 : mesh.N
        x = mesh.P(:, mesh.T(:, n));
        for beta = 1 : test_elements.N_lb
            j = test_elements.Tb(beta, n);
            val = problem.Linear(test_elements, beta, n, x);
            b(j) = b(j) + val;
        end
    end
end