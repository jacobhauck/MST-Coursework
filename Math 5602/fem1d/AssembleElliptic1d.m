function [A, b] = AssembleElliptic1d(c, f, trial_elements, test_elements, integrator)
    % Assemble stiffness matrix and load vector for 1D elliptic equation
    % with coefficient c(x) and forcing function f(x):
    %     d/dx (c(x) du/dx) = f(x)
    %
    % Parameters
    % ----------
    %   c: Callable mapping (1, k) -> (1, k) computing the value of the
    %      coefficient function
    %   f: Callable mapping (1, k) -> (1, k) computing the value of the
    %      forcing function
    %   trial_elements: Finite element basis object for trial function
    %   test_elements: Finite element basis object for test function
    %   integrator: Integrator object for numerical integration
    %
    % Return
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

    % Precompute local basis functions and their derivatives in reference 
    % domain [0, 1] at reference quadrature nodes
    trial_dBasis_vals = trial_elements.EvalLocalBasisDerivativeReference(integrator.x);
    % (N_lb_trial, n)
    test_dBasis_vals = test_elements.EvalLocalBasisDerivativeReference(integrator.x);
    % (N_lb_test, n)
    
    % Assemble A
    N_lb_trial = size(trial_dBasis_vals, 1);
    N_lb_test = size(test_dBasis_vals, 1);
    
    Nb = test_elements.Nb;
    if Nb ~= trial_elements.Nb
        error("Dimension of trial space must equal dimension of test space");
    end
    A = sparse(Nb, Nb);

    % Loop over elements
    for n = 1 : mesh.N
        % Get element coordinates
        x = mesh.P(:, mesh.T(:, n));
        
        for alpha = 1:N_lb_trial  % For trial function
            i = trial_elements.Tb(alpha, n);
            trial_dBasis = trial_dBasis_vals(alpha, :) / (x(2) - x(1));
            
            for beta = 1:N_lb_test  % For test function
                j = test_elements.Tb(beta, n);
                test_dBasis = test_dBasis_vals(beta, :) / (x(2) - x(1));
                val = integrator.integrate(@(x) c(x) .* test_dBasis .* trial_dBasis, x(1), x(2));
                A(j, i) = A(j, i) + val;
            end
        end
    end

    % Assemble b
    b = zeros(Nb, 1);

    test_basis_vals = test_elements.EvalLocalBasisReference(integrator.x);
    % (N_lb_test, n)
    
    for n = 1 : mesh.N
        % Get element coordinates
        x = mesh.P(:, mesh.T(:, n));

        for beta = 1:N_lb_test  % For test function
            j = test_elements.Tb(beta, n);
            test_basis = test_basis_vals(beta, :);
            val = integrator.integrate(@(x) f(x) .* test_basis, x(1), x(2));
            b(j) = b(j) + val;
        end
    end
end