classdef LinearElements1d < handle

    properties
        % Mesh1d mesh object
        mesh
        
        % Number of basis functions
        Nb

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
    end
end