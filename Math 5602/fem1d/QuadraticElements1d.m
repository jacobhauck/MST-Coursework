classdef QuadraticElements1d < handle
    % Defines a quadratic 1D finite element basis

    properties
        % Mesh1d mesh object
        mesh
        
        % Number of basis functions Nb = 2 * mesh.N + 1
        Nb

        % Number of local basis functions
        N_lb = 3

        % (1, Nb) Finite element node matrix
        Pb

        % (3, mesh.N) Finite element index matrix
        Tb
    end

    methods
        function self = QuadraticElements1d(mesh)
            self.mesh = mesh;
            self.Nb = 2 * mesh.N + 1;

            % Create finite element nodes
            self.Pb = zeros(1, self.Nb);
            self.Pb(1 : 2 : 2 * mesh.N + 1) = mesh.P;
            self.Pb(2 : 2 : 2 * mesh.N) = (mesh.P(1 : end-1) + mesh.P(2:end)) / 2.0;
            
            % Create finite element node indices
            self.Tb = [
                1 : 2 : 2 * mesh.N - 1;
                3 : 2 : 2 * mesh.N + 1;
                2 : 2 : 2 * mesh.N
            ];
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
            
            x_sq = x.^2;

            basis = [2*x_sq - 3*x + 1; 2*x_sq - x; -4*x_sq + 4*x];
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

            dBasis = [4*x - 3; 4*x - 1; -8*x + 4];
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
                lbf = self.mesh.ReferenceToLocal(@(x) 2 * x.^2 - 3*x + 1, i_elem);
            elseif i_lb == 2
                lbf = self.mesh.ReferenceToLocal(@(x) 2 * x.^2 - x, i_elem);
            elseif i_lb == 3
                lbf = self.mesh.ReferenceToLocal(@(x) -4 * x.^2 + 4*x, i_elem);
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
                lbf = self.mesh.ReferenceToLocalDerivative(@(x) 4*x - 3, i_elem);
            elseif i_lb == 2
                lbf = self.mesh.ReferenceToLocalDerivative(@(x) 4*x - 1, i_elem);
            elseif i_lb == 3
                lbf = self.mesh.ReferenceToLocalDerivative(@(x) -8*x + 4, i_elem);
            else
                error("Invalid index: %d", i_lb);
            end
        end
    end
end