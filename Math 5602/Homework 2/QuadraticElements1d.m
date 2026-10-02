classdef QuadraticElements1d < FiniteElementSpace1d
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

        % left boundary node index
        boundary_left = 1

        % right boundary node index
        boundary_right
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

            % Set boundary nodes
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
                    bf = @(x) 2 * x.^2 - 3*x + 1;
                elseif order == 1
                    bf = @(x) 4*x - 3;
                elseif order == 2
                    bf = @(x) 4 * One(x);
                else
                    bf = @(x) Zero(x);
                end
            elseif i_lb == 2
                if order == 0
                    bf = @(x) 2 * x.^2 - x;
                elseif order == 1
                    bf = @(x) 4*x - 1;
                elseif order == 2
                    bf = @(x) 4 * One(x);
                else
                    bf = @(x) Zero(x);
                end
            elseif i_lb == 3
                if order == 0
                    bf = @(x) -4 * x.^2 + 4 * x;
                elseif order == 1
                    bf = @(x) -8*x + 4;
                elseif order == 2
                    bf = @(x) -8 * One(x);
                else
                    bf = @(x) Zero(x);
                end
            else
                error("Invalid index: %d", i_lb);
            end
        end
    end
end