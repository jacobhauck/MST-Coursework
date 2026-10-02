classdef (Abstract) FiniteElementSpace1d < FiniteElementSpace
    properties (Abstract)
        % the left endpoint finite element node index
        boundary_left

        % the right endpoint finite element node index
        boundary_right
    end
end