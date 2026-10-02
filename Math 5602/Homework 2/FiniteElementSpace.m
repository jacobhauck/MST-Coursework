classdef (Abstract) FiniteElementSpace < handle
    properties (Abstract)
        % Mesh object
        mesh
        
        % Number of basis functions
        Nb

        % Number of local basis functions
        N_lb

        % (d, Nb) Finite element node matrix
        Pb

        % (N_lb, mesh.N) Finite element index matrix
        Tb
    end

    methods (Abstract)
        bf = ReferenceBasisFunction(self, i_lb, order)
        % Get the reference basis function with the given index of the
        % given derivative order
        %
        % Parameters
        % ----------
        %   i_lb: Local basis function index
        %   order: (1, d) Derivative order multi-index
        % 
        % Return
        % ------
        %   bf: Callable mapping (d, n) -> (shape, n) that evaluates
        %       the local basis function derivative at given points.
    end

    methods
        function lbf = LocalBasisFunction(self, i_lb, i_elem, order)
            % Get the reference basis function with the given index of the
            % given derivative order at the given element
            %
            % Parameters
            % ----------
            %   i_lb: Local basis function index
            %   i_elem: Index of the mesh element
            %   order: (1, d) Derivative order multi-index
            % 
            % Return
            % ------
            %   lbf: Callable mapping (d, n) -> (shape, n) that evaluates
            %        the local basis function derivative at given points.

            tf = ReferenceFEBasisFunction(self, i_lb);
            lbf = self.mesh.ReferenceToLocal(tf, i_elem, order);
        end
    end
end