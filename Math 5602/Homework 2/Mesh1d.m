classdef Mesh1d < Mesh
    properties
        % Number of elements
        N

        % Number of nodes
        Nm

        % (1, N+1) mesh points
        P

        % (2, N) mesh elements; indexes P
        T
    end

    methods
        function self = Mesh1d(x)
            % Creates a mesh on an interval with the given nodes
            %
            % Parameters
            % ----------
            %  x: (1, N+1) mesh nodes
            
            self.N = length(x) - 1;
            self.Nm = self.N + 1;
            if self.N < 1
                error("Not enough mesh nodes");
            end

            self.P = sort(x);
            self.T = [1 : self.N; 2 : (self.N + 1)];
        end

    end

    methods
        function f = ReferenceToLocal(self, f_ref, i_elem, order)
            % Transform a given function f_ref defined on the reference
            % domain [0, 1] to the element with the given index.
            %
            % Parameters
            % ----------
            %   f_ref: TransformableFunction that evaluates a
            %          function in the reference domain [0, 1]
            %   i_elem: Index of mesh element to transform to
            %   order: Derivative order
            % 
            % Return
            % ------
            %   f: Callable mapping (1, n) -> (1, n) that evaluates f_ref
            %      after affine mapping to the given mesh element
            
            x = self.P(:, self.T(:, i_elem));
            m = x(2) - x(1);
            df = f_ref.Derivative(order);
            f = @(x_) df((x_ - x(1)) / m) / m^order;
        end
    end

    methods(Static)
        function obj = Uniform(a, b, N)
            % Creates a mesh with N uniformly-sized elements on the
            % interval (a, b)
            %
            % Parameters
            % ----------
            %   a: left endpoint
            %   b: right endpoint
            %   N: number of elements
            %
            % Return
            % ------
            %   obj: Mesh1d with N uniformly-sized elements on (a, b)

            x = linspace(a, b, N + 1);
            obj = Mesh1d(x);
        end
    end
end