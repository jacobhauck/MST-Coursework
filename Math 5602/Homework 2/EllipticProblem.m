classdef EllipticProblem < handle
    % Represents an elliptic problem with scalar coefficient function in
    % d dimensions

    properties
        % Coefficient function, callable mapping (d, n) -> (1, n)
        c

        % Forcing function, callable mapping (d, n) -> (1, n)
        f

        % Boundary condition descriptor
        bc
        
        % Integrator object for numerical integration
        integrator
    end

    methods
        function self = EllipticProblem(c, f, bc, integrator)
            % Create an EllipticProblem with the given coefficient
            % function and forcing function and integrator
            %
            % Parameters
            % ----------
            %   c: Coefficient function, callable mapping (d, n) -> (1, n)
            %   f: Forcing function, callable mapping (d, n) -> (1, n)
            %   bc: Boundary condition descriptor object
            %   integrator: integrator object
            
            self.c = c;
            self.f = f;
            self.bc = bc;
            self.integrator = integrator;
        end

        function u_approx = Solve(self, trial_elements, test_elements)
            % Uses the finite element method to solve this elliptic problem
            % using the given trial and test finite element spaces
            %
            % Parameters
            % ----------
            %   trial_elements: The trial finite element space object
            %   test_elements: The test finite element space object
            %
            % Return
            % ------
            %   u_approx: (1, trial_elements.Nb) The coefficients of the 
            %             approximate solution in the given trial finite 
            %             element basis

            A = AssembleStiffnessMatrix(EllipticBilinear(self.c, self.integrator), trial_elements, test_elements);
            b = AssembleLoadVector(ForcingLinear(self.f, self.integrator), test_elements);
            [A, b] = self.bc.apply(A, b, trial_elements, test_elements);
            u_approx = (A \ b)';
        end
    end
end