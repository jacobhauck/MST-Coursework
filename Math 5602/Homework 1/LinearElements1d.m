classdef LinearElements1d < handle
    % Defines a linear 1D finite element basis

    properties
        % Mesh1d mesh object
        mesh
        
        % Number of basis functions
        Nb

        % Number of local basis functions
        N_lb = 2

        % (1, mesh.Nm) Finite element node matrix
        Pb

        % (2, mesh.N) Finite element index matrix
        Tb
    end

    methods
        function self = LinearElements1d(mesh)
            self.mesh = mesh;
            self.Nb = self.mesh.Nm;
            self.Pb = mesh.P;
            self.Tb = mesh.T;
        end

        function basis = EvalLocalBasisReference(~, x)
            % Evaluate the local basis functions in the reference domain
            % [0, 1]
            % 
            % Parameters
            % ----------
            %   x: (1, n) points at which to evaluate the local basis
            %      functions
            % 
            % Return
            % ------
            %   basis: (2, n) local basis function values at x
            
            basis = [1 - x; x];
        end

        function dBasis = EvalLocalBasisDerivativeReference(~, x)
            % Evaluate the local basis functions' derivatives in the
            % reference domain [0, 1]
            %
            % Parameters
            % ----------
            %   x: (1, k) points at which to evaluate the local basis
            %      functions' derivatives
            %
            % Return
            % ------
            %   dBasis: (2, k) derivatives of the local basis functions at
            %           x

            one = ones(size(x));
            dBasis = [-one; one];
        end

        function lbf = LocalBasisFunction(self, i_lb, i_elem)
            % Get the local basis function with the given index at the
            % given element
            %
            % Parameters
            % ----------
            %   i_lb: Local basis function index (1 or 2)
            %   i_elem: Element index
            % 
            % Return
            % ------
            %   lbf: Callable mapping (1, n) -> (1, n) that evaluates
            %        the local basis function at given points
            
            if i_lb == 1
                lbf = self.mesh.ReferenceToLocal(@(x) 1 - x, i_elem);
            elseif i_lb == 2
                lbf = self.mesh.ReferenceToLocal(@(x) x, i_elem);
            else
                error("Invalid index: %d", i_lb);
            end
        end

        function lbf = LocalBasisFunctionDerivative(self, i_lb, i_elem)
            % Get the local basis function derivatives with the given index
            % at the given element
            %
            % Parameters
            % ----------
            %   i_lb: Local basis function index (1 or 2)
            %   i_elem: Element index
            % 
            % Return
            % ------
            %   lbf: Callable mapping (1, n) -> (1, n) that evaluates
            %        the local basis function derivative at given points

            if i_lb == 1
                lbf = self.mesh.ReferenceToLocalDerivative(@(x) -ones(size(x)), i_elem);
            elseif i_lb == 2
                lbf = self.mesh.ReferenceToLocalDerivative(@(x) ones(size(x)), i_elem);
            else
                error("Invalid index: %d", i_lb);
            end
        end
    end
end