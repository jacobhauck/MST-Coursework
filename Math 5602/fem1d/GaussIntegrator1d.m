classdef GaussIntegrator1d
    % Integrator for FEM in 1D that uses Gauss-Legendre quadrature

    properties
        % Number of quadrature nodes
        n
        
        % (1, n) reference nodes on [0, 1]
        x

        % (1, n) reference weights on [0, 1]
        w
    end

    methods
        function self = GaussIntegrator1d(n)
            % Constructs a GaussIntegrator1d object with n nodes
            %
            % Parameters
            % ----------
            %   n: number of quadrature nodes
            
            if n <= 0
                error("Number of quadrature nodes must be positive");
            end
            self.n = n;
            
            % Calculate reference nodes and weights
            c = Legendre(n);
            x = roots(flip(c));
            
            w = zeros(size(x));
            for i = 1:n
                deriv = 0;
                power = 1;
                for j = 1 : n
                    deriv = deriv + c(j+1) * j * power;
                    power = power * x(i);
                end
                w(i) = 2 / (1 - x(i)^2) / deriv^2;
            end
            
            % Above calculation is for [-1, 1], so map to [0, 1]
            self.x = ((x + 1) / 2)';
            self.w = (w/2)';
        end
        
        function integral = integrate(self, f, a, b)
            % Computes the integral of f on [a, b] using this integrator
            %
            % Parameters
            % ----------
            %   f: Callable mapping (1, n) -> (1, n), computing values of
            %      integrand
            %   a: Lower bound of domain
            %   b: Upper bound of domain

            x_g = self.x * (b - a) + a;
            w_g = self.w * (b - a);
            integral = f(x_g) * w_g';
        end
    end
end