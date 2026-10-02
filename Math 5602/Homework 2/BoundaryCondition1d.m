classdef (Abstract) BoundaryCondition1d < handle
    % Represents a single boundary condition in 1d

    methods (Abstract)
        [A, b] = apply(self, A_in, b_in, side, x, trial_node, test_node)
        % Applies the boundary condition to a given stiffness matrix and
        % load vector
        %
        % Parameters
        % ----------
        %   A_in: input stiffness matrix
        %   b_in: input load vector
        %   side: either 'l' or 'r', indicating which side the condition is
        %         being applied on
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
    end
end