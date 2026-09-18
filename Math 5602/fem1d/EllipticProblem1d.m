classdef EllipticProblem1d < handle
    properties
        % Coefficient function, callable mapping (1, n) -> (1, n)
        c

        % Forcing function, callable mapping (1, n) -> (1, n)
        f
        
        % Integrator object for numerical integration
        integrator
    end

    methods
        function self = EllipticProblem1d(c, f, integrator)
            % Create an EllipticProblem1d with the given coefficient
            % function and forcing function and integrator
            %
            % Parameters
            % ----------
            %   c: Coefficient function, callable mapping (1, n) -> (1, n)
            
            self.c = c;
            self.f = f;
            self.integrator = integrator;
        end

        function value = Bilinear(self, trial_elements, alpha, test_elements, beta, n, x)
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
            %   x: (1, 2) coordinates of the mesh nodes for the current
            %      element
            % 
            % Return
            % ------
            %   value: value of the bilinear form on the given mesh element
            %          with the given local basis functions
            
            dtrial = trial_elements.LocalBasisFunctionDerivative(alpha, n);
            dtest = test_elements.LocalBasisFunctionDerivative(beta, n);
            value = self.integrator.integrate(@(x_) self.c(x_) .* dtrial(x_) .* dtest(x_), x(1), x(2));
        end

        function value = Linear(self, test_elements, beta, n, x)
            % Evaluates the linear form for the problem restricted to a
            % given element with given local test basis function
            %
            % Parameters
            % ----------
            %   test_elements: A finite element basis object for the test
            %                  functions
            %   beta: Index of the local test basis function
            %   n: Index of the mesh element
            %   x: (1, 2) coordinates of the mesh nodes for the current
            %      element
            % 
            % Return
            % ------
            %   value: value of the linear form on the given mesh element
            %          with the given local basis function

            dtest = test_elements.LocalBasisFunction(beta, n);
            value = self.integrator.integrate(@(x_) self.f(x_) .* dtest(x_), x(1), x(2));
        end
    end
end