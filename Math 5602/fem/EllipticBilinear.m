function bilinear = EllipticBilinear(c, integrator)
    % Creates a bilinear form for an elliptic problem with scalar
    % coefficient function using the given numerical integration
    %
    % Parameters
    % ----------
    %   c: Coefficient function, callable mapping (d, n) -> (1, n)
    %   integrator: Integration object that can integrate on the desired
    %               elements
    %
    % Return
    % ------
    %   bilinear: Callable bilinear form compatible with
    %             AssembleStiffnessMatrix

    function value = Bilinear(trial_elements, alpha, test_elements, beta, n, x)
        % Evaluates the bilinear form for the problem restricted to a
        % given element with given local trial and test basis functions
        %
        % Parameters
        % ----------
        %   trial_elements: A finite element basis object for the trial
        %                   functions
        %   alpha: Index of the local trial basis function
        %   test_elements: A finite element basis object for the test
        %                  functions
        %   beta: Index of the local test basis function
        %   n: Index of the mesh element
        %   x: (d, k) coordinates of the mesh nodes for the current
        %      element
        % 
        % Return
        % ------
        %   value: value of the bilinear form on the given mesh element
        %          with the given local basis functions
        
        dtrial = trial_elements.LocalBasisFunction(alpha, n, 1);
        dtest = test_elements.LocalBasisFunction(beta, n, 1);
        value = integrator.integrate(@(x_) c(x_) .* sum(dtrial(x_) .* dtest(x_), 1), x);
    end

    bilinear = @Bilinear;
end