classdef (Abstract) BoundaryConditions < handle
    % Abstract base class for boundary condition descriptors
    methods (Abstract)
        [A, b] = apply(self, A_in, b_in, trial_elements, test_elements);
        % Applies the boundary conditions to given stiffness matrix and
        % load vector, assuming the given trial and test elements
        %
        % Parameters
        % ----------
        %   A_in: input stiffness matrix to apply boundary conditions to
        %   b_in: input load vector to apply boundary conditions to
        %   trial_elements: trial elements to use for boundary conditions
        %   test_elements: test elements to use for boundary conditions
        %
        % Return
        % ------
        %   A: stiffness matrix with boundary conditions applied
        %   b: load vector with boundary conditions applied
    end
end