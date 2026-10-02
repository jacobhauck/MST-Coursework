classdef EllipticRobin1d < BoundaryCondition1d
    % Defines 1D Robin boundary conditions of the form
    %   u' + q(1)u = p(1)
    % for an elliptic problem

    properties
        % The coefficient function
        c

        % value on right-hand side
        p

        % coefficient of u on the left-hand side
        q
    end

    methods
        function self = EllipticRobin1d(c, p, q)
            % Creates Robin boundary conditions with the given values
            self.c = c;
            self.p = p;
            self.q = q;
        end

        function [A, b] = apply(self, A_in, b_in, side, x, trial_node, test_node)
            % Applies the boundary condition to a given stiffness matrix and
            % load vector
            %
            % Parameters
            % ----------
            %   A_in: input stiffness matrix
            %   b_in: input load vector
            %   x: coordinates of the point where this condition is being
            %      applied
            %   trial_node: index of the trial finite element node/basis function
            %               that is nonzero where this condition is being applied
            %   test_node: index of the test finite element node/basis function
            %              that is nonzero where this condition is being applied
            %
            % Return
            % ------
            %   A: updated stiffness matrix
            %   b: updated load vector

            % Now x = [a, b], apply boundary conditions to active points
            A = A_in;
            b = b_in;
            
            if side == 'l'
                sign = -1;
            elseif side == 'r'
                sign = 1;
            else
                error("Invalid side: must be 'l' or 'r'");
            end
            
            cx = self.c(x);
            b(test_node) = b(test_node) + sign * self.p * cx;
            A(test_node, trial_node) = A(test_node, trial_node) + sign * self.q * cx;
        end
    end
end