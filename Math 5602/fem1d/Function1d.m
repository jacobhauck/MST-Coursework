function u = Function1d(elements, c, x)
    % Evaluates a function given its coefficients in a
    % finite-element basis
    %
    % Parameters
    % ----------
    %   c: (1, Nb) coefficients of u in this basis
    %   x: (1, n) points at which to evaluate the function
    %
    % Return
    % ------
    %   u: (1, n) value of function with coefficients c at x
    
    % Get indices of elements to use for each x
    element_indices = discretize(x, elements.mesh.P);  % (1, n)
    
    % Get left and right endpoints for each x
    i_left = elements.mesh.T(1, element_indices);  % (1, n)
    i_right = elements.mesh.T(2, element_indices);  % (1, n)
    xl = elements.P(i_left);  % (1, n)
    xr = elements.P(i_right);  % (1, n)

    % Convert to reference domain
    x_ref = (x - xl) ./ (xr - xl);  % (1, n)

    % Evaluate in reference domain
    basis_local = elements.EvalLocalBasisReference(x_ref);  % (N_lb, n)

    % Get coefficients for local basis functions
    c_local = c(elements.Tb(:, element_indices));  % (N_lb, n)

    % Sum local basis functions for each x
    u = sum(c_local .* basis_local, 1);  % (1, n)
end