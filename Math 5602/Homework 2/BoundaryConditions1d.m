classdef BoundaryConditions1d < BoundaryConditions
    % Represents boundary conditions in 1d and provides general methods
    % for specifying boundary conditions.
    %
    % In 1d, we only need to worry about the left and right boundary
    % conditions. In implementations of BoundaryConditions for higher
    % dimensions we will need to use a more complex framework.

    properties
        % Left boundary condition
        left_condition

        % Right boundary condition
        right_condition
    end

    methods
        function self = BoundaryConditions1d(left_condition, right_condition)
            self.left_condition = left_condition;
            self.right_condition = right_condition;
        end

        function [A, b] = apply(self, A_in, b_in, trial_elements, test_elements)
            x_left = trial_elements.Pb(:, trial_elements.boundary_left);
            [A, b] = self.left_condition.apply(A_in, b_in, 'l' , x_left, trial_elements.boundary_left, test_elements.boundary_left);

            x_right = test_elements.Pb(:, test_elements.boundary_right);
            [A, b] = self.right_condition.apply(A, b, 'r', x_right, trial_elements.boundary_right, test_elements.boundary_right);
        end
    end
    
end