function linear = ForcingLinear(f, integrator)
    % Creates a callable linear form corresponding to a given forcing
    % function
    %
    % Parameters
    % ----------
    %   f: Forcing function, callable mapping (d, n) -> (1, n)
    %   integrator: Integrator object capable of integrating on the desired
    %               elements
    %
    % Return
    % ------
    %   linear: Function implementing the linear form that is compatible
    %           with AssembleLoadVector

    function value = Linear(test_elements, beta, n, x)
        % Evaluates the linear form for the problem restricted to a
        % given element with given local test basis function
        %
        % Parameters
        % ----------
        %   test_elements: A finite element basis object for the test
        %                  functions
        %   beta: Index of the local test basis function
        %   n: Index of the mesh element
        %   x: (d, k) coordinates of the mesh nodes for the current
        %      element
        % 
        % Return
        % ------
        %   value: value of the linear form on the given mesh element
        %          with the given local basis function

        test = test_elements.LocalBasisFunction(beta, n, 0);
        value = integrator.integrate(@(x_) f(x_) .* test(x_), x);
    end
    
    linear = @Linear;
end