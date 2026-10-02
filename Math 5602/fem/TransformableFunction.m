classdef (Abstract) TransformableFunction < handle
    % Represents a function and its derivatives that can be transformed
    % using the chain rule

    properties (Abstract)
        % Dimension of the domain of the function
        d
    end

    methods (Abstract)
        f = Derivative(self, order)
        % Gets the partial derivative of the function of a given order
        %
        % Parameters
        % ----------
        %   order: (1, d) the order of the derivative
        %
        % Return
        % ------
        %   f: callable mapping (d, n) -> (1, n), the derivative of the
        %      function of the given order
    end

    methods
        function df = FullDerivative(self, order)
            % Computes the full tensor derivative of the function at a
            % given order
            %
            % Parameters
            % ----------
            %   order: The order of the derivative
            %
            % Return
            % ------
            %   df: Callable (d, n) -> (d, d, ..., d, n), full derivative
            %                           |-- order --|
            %       tensor-valued function

            if order == 0
                df = self.Derivative(0);
                return;
            end
            
            % Need to handle order == 1 separately because of MATLAB's
            % matrix defaulting
            if order == 1
                df_cell = cell(1, self.d);  % (1, d)
            else
                df_cell = cell(self.d * ones(1, order));  % (d, d, ..., d)
            end

            index = cell(1, order);  % (1, order)
            
            for alpha_flat = 1 : numel(df_cell)
                [index{:}] = ind2sub(size(df_cell), alpha_flat);
                partial_order = zeros(1, self.d);
                for i = 1 : order
                    partial_order(index{i}) = partial_order(index{i}) + 1;
                end
                df_cell{alpha_flat} = self.Derivative(partial_order);
            end
            
            function tensor = df_tensor(x)
                tensor = zeros(numel(df_cell), size(x, 2));
                i_multi = cell(1, self.d);
                for i_flat = 1 : numel(df_cell)
                    [i_multi{:}] = ind2sub(size(df_cell), i_flat);
                    df_i = df_cell{i_flat};
                    tensor(i_flat, :) = df_i(x);
                end
                
                % Again, handle d == 1 and order == 1 cases separately due
                % to matrix defaulting
                if self.d > 1
                    if order == 1
                        cell_size = self.d;
                    else
                        cell_size = size(df_cell);
                    end
                    tensor = reshape(tensor, [cell_size, size(x, 2)]);
                end
            end

            df = @df_tensor;
        end
    end
end