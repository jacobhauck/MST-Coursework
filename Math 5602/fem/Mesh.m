classdef (Abstract) Mesh < handle
    properties (Abstract)
        % Number of mesh elements
        N

        % Number of mesh nodes
        Nm

        % (d, Nm) mesh nodes
        P

        % (k, N) mesh elements; indexes P
        T
    end
    
    methods (Abstract)
        f = ReferenceToLocal(self, f_ref, i_elem, order)
        % Transform a given function's derivative defined on the 
        % mesh's reference domain to the element with the given index.
        %
        % Parameters
        % ----------
        %   f_ref: TransformableFunction defined on the reference domain
        %   i_elem: Index of mesh element to transform to
        %   order: (1, d) derivative order multi-index
        % 
        % Return
        % ------
        %   f: Callable mapping (d, n) -> (1, n) that evaluates f_ref
        %      after affine mapping to the given mesh element.
    end
end