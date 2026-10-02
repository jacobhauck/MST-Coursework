classdef TestFunction < TransformableFunction
    properties
        d = 2
    end

    methods
        function f = Derivative(~, order)
            if all(order == [0, 0])
                f = @(x) x(1, :).^2 .* x(2, :).^2;
            elseif all(order == [1, 0])
                f = @(x) 2*x(1, :) .* x(2, :).^2;
            elseif all(order == [0, 1])
                f = @(x) 2 * x(1, :).^2 .* x(2, :);
            elseif all(order == [2, 0])
                f = @(x) 2 * x(2, :).^2;
            elseif all(order == [1, 1])
                f = @(x) 4 * x(1, :) .* x(2, :);
            elseif all(order == [0, 2])
                f = @(x) 2 * x(1, :).^2;
            elseif all(order == [1, 2])
                f = @(x) 4 * x(1, :);
            elseif all(order == [2, 1])
                f = @(x) 4 * x(2, :);
            elseif all(order == [2, 2])
                f = @(x) 4 * One(x);
            else
                f = @Zero;
            end
        end
    end
end