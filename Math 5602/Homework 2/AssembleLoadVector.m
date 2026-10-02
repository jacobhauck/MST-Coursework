function b = AssembleLoadVector(linear, test_elements)
    % Assemble finite element load vector for a given linear form
    %
    % Parameters
    % ----------
    %   linear: Callable implementing a linear form
    %   test_elements: Finite element basis object for test function
    %
    % Return
    % ------
    %   b: (Nb, 1) load vector of the equation using the given
    %      finite element discretization
    %
    
    mesh = test_elements.mesh;

    % Assemble b
    b = zeros(test_elements.Nb, 1);
    for n = 1 : mesh.N
        x = mesh.P(:, mesh.T(:, n));
        for beta = 1 : test_elements.N_lb
            j = test_elements.Tb(beta, n);
            val = linear(test_elements, beta, n, x);
            b(j) = b(j) + val;
        end
    end
end