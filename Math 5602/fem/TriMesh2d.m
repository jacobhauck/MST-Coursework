classdef TriMesh2d < Mesh
    properties
        % Number of elements
        N

        % Number of nodes
        Nm

        % (2, Nm) mesh points
        P

        % (3, N) mesh elements; indexes P
        T
    end

    methods
        function self = TriMesh2d(P, T)
            % Creates a mesh on an interval with the given nodes
            %
            % Parameters
            % ----------
            %   P: (2, Nm) mesh points
            %   T: (3, N) mesh elements
            
            self.N = size(T, 2);
            self.Nm = size(P, 2);
            self.P = P;
            self.T = T;
        end

    end

    methods
        function f = ReferenceToLocal(self, f_ref, i_elem, order)
            % Transform a given function f_ref defined on the reference
            % domain to the element with the given index.
            %
            % Parameters
            % ----------
            %   f_ref: TransformableFunction defined on the reference
            %          domain
            %   i_elem: Index of mesh element to transform to
            %   order: (1, 2) derivative order
            % 
            % Return
            % ------
            %   f: Callable mapping (2, n) -> (1, n) that evaluates f_ref
            %      after affine mapping to the given mesh element
            
            x = self.P(:, self.T(:, i_elem));
            a_forward = [
                x(1, 2) - x(1, 1), x(1, 3) - x(1, 1);
                x(2, 2) - x(2, 1), x(2, 3) - x(2, 1)
            ];

            a_inv = inv(a_forward);
            b_inv = -a_inv * x(:, 1);
            f = AffineReferenceToLocal(f_ref, a_inv, b_inv, order);
        end
    end

    methods(Static)
        function obj = UniformRectangle(x_bounds, y_bounds, Nx, Ny)
            % Creates a mesh with N uniformly-sized elements on the
            % rectangle [x_bounds(1), y_bounds(1)] x [x_bounds(2),
            % y_bounds(2)] by splitting a uniform grid of rectangles
            % along diagonals
            %
            % Parameters
            % ----------
            %   x_bounds: (1, 2) x limits of the rectangular domain
            %   y_bounds: (1, 2) y limits of the rectangular domain
            %   Nx: number of grid cells in the x direction
            %   Ny: number of grid cells in the y direction
            %
            % Return
            % ------
            %   obj: TriMesh2d with uniformly-sized elements on the
            %        rectangular domain
            
            x = linspace(x_bounds(1), x_bounds(2), Nx + 1);
            y = linspace(y_bounds(1), y_bounds(2), Ny + 1);
            P = zeros(2, (Nx + 1) * (Ny + 1));
            T = zeros(3, 4*Nx*Ny);
            
            k = 1;
            for j = 1 : Ny
                for i = 1 : Nx
                    bot_left = i - 1 + (j - 1) * (Nx + 1);
                    bot_right = left + 1;
                    top_left = bot_left + Nx + 1;
                    top_right = top_left + 1;
                    P(:, bot_left + 1) = [x(i); y(j)];
                    P(:, bot_right + 1) = [x(i + 1); y(j)];
                    P(:, top_left + 1) = [x(i); y(j + 1)];
                    P(:, top_right + 1) = [x(i + 1); y(j + 1)];
                    T(:, k) = [bot_left; bot_right; top_left];
                    T(:, k + 1) = [bot_right; top_right; top_left];
                    k = k + 2;
                end
            end

            obj = TriMesh2d(P, T);
        end
    end
end