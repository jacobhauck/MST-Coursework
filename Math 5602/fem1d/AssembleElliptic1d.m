function [A, b] = AssembleElliptic1d(c, f, elements, integrator)
    % Assemble stiffness matrix and load vector for 1D elliptic equation
    % with coefficient c(x) and forcing function f(x)
    %
    % Parameters
    % ----------
    %   c: Callable mapping (1, k) -> (1, k) computing the value of the
    %      coefficient function
    %   f: Callable mapping (1, k) -> (1, k) computing the value of the
    %      forcing function
    %   elements: Finite element basis object
    %   integrator: Integrator object for numerical integration
    %
    % Return
    %   A: (elements.Nb, elements.Nb) stiffness matrix of the elliptic
    %      equation using the given finite element discretization
    %   b: (elements.Nb, 1) load vector of the equation using the given
    %      finite element discretization
    %   

    % Precompute local basis functions and their derivatives in reference 
    % domain [0, 1]
    basis_vals = elements.EvalLocalBasisReference(integrator.x);
    % (N_lb, n)
    dBasis_vals = elements.EvalLocalBasisDerivativeReference(integrator.x);
    % (N_lb, n)
    
    % Assemble A
    N_lb = size(basis_vals, 1);
    A = sparse(elements.Nb, elements.Nb);
    for i_elem = 1 : elements.mesh.N
        % Get element coordinates
        xl = elements.mesh.P(elements.mesh.T(1, i_elem));
        xr = elements.mesh.P(elements.mesh.T(2, i_elem));
        
        for i_lb = 1:N_lb  % For test function
            i_node = elements.Tb(i_lb, i_elem);
            dBasis_i = dBasis_vals(i_lb, :) / (xr - xl);
            
            for j_lb = 1:N_lb  % For trial function
                j_node = elements.Tb(j_lb, i_elem);
                dBasis_j = dBasis_vals(j_lb, :) / (xr - xl);
                val = integrator.integrate(@(x) c(x) .* dBasis_i .* dBasis_j, xl, xr);
                A(i_node, j_node) = A(i_node, j_node) + val;
            end
        end
    end

    % Assemble b
    b = zeros(elements.Nb, 1);
    for i_elem = 1 : elements.mesh.N
        % Get element coordinates
        xl = elements.mesh.P(elements.mesh.T(1, i_elem));
        xr = elements.mesh.P(elements.mesh.T(2, i_elem));

        for i_lb = 1:N_lb  % For test function
            i_node = elements.Tb(i_lb, i_elem);
            basis_i = basis_vals(i_lb, :);
            val = integrator.integrate(@(x) f(x) .* basis_i, xl, xr);
            b(i_node) = b(i_node) + val;
        end
    end
end