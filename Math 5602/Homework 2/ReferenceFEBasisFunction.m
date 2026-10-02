classdef ReferenceFEBasisFunction < TransformableFunction
    properties
        % Dimension of the domain
        d

        % Finite element basis this function is attached to
        elements

        % Local basis function index of this basis function
        i_lb
    end

    methods
        function self = ReferenceFEBasisFunction(elements, i_lb)
            self.d = size(elements.Pb, 1);
            self.elements = elements;
            self.i_lb = i_lb;
        end
        
        function f = Derivative(self, order)
            f = self.elements.ReferenceBasisFunction(self.i_lb, order);
        end
    end

end