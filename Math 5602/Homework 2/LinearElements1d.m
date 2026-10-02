classdef LinearElements1d < FiniteElementSpace1d
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

        % Left boundary node index
        boundary_left = 1
        
        % Right boundary node index
        boundary_right
    end

    methods
        function self = LinearElements1d(mesh)
            self.mesh = mesh;
            self.Nb = self.mesh.Nm;
            self.Pb = mesh.P;
            self.Tb = mesh.T;
            self.boundary_right = self.Nb;
        end

        function bf = ReferenceBasisFunction(~, i_lb, order)
            % Get the reference basis function with the given index at the
            % given element and derivative order
            %
            % Parameters
            % ----------
            %   i_lb: Local basis function index
            %   order: derivative order multiindex
            % 
            % Return
            % ------
            %   bf: Callable mapping (1, n) -> (1, n) that evaluates
            %       the local basis function at given points
            
            if i_lb == 1
                if order == 0
                    bf = @(x) 1 - x;
                elseif order == 1
                    bf = @(x) -One(x);
                else
                    bf = @(x) Zero(x);
                end
            elseif i_lb == 2
                if order == 0
                    bf = @(x) x;
                elseif order == 1
                    bf = @(x) One(x);
                else
                    bf = @(x) Zero(x);
                end
            else
                error("Invalid index: %d", i_lb);
            end
        end
    end
end