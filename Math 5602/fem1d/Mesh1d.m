classdef Mesh1d < handle
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

    methods(Static)
        function obj = Uniform(a, b, N)
            % Creates a mesh with N uniformly-sized elements on the
            % interval (a, b)
            x = linspace(a, b, N + 1);
            obj = Mesh1d(x);
        end
    end
end