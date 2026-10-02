classdef Dirichlet1d < BoundaryCondition1d
    % Applies Dirichlet boundary conditions in 1 dimension

    properties
        % Value
        g
    end

    methods
        function self = Dirichlet1d(g)
            % Create a Dirichlet boundary condition descriptor
            self.g = g;
        end

        function [A, b] = apply(self, A_in, b_in, ~, ~, trial_node, test_node)
            % Applies the Dirichlet boundary condition
            A = A_in;
            b = b_in;

            A(test_node, :) = 0.0;
            A(test_node, trial_node) = 1.0;
            b(test_node) = self.g;
        end
    end
end