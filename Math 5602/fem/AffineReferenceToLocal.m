function f = AffineReferenceToLocal(f_ref, A, b, order)
    % Transforms a function or one of its derivatives from the reference 
    % domain D_ref to a domain D, where D_ref is the affine image of D: 
    %
    %   D_ref = AD + b          (1)
    %
    % for the given d x d matrix A and d x 1 vector b.
    %
    % Parameters
    % ----------
    %   f_ref: TransformableFunction to transform
    %   A: (d, d) transformation matrix representing the linear part of the
    %      affine mapping from D to D_ref (see (1))
    %   b: (d, 1) translation vector part of the affine mapping
    %   order: (1, d) order of the partial derivative of f_ref to transform
    %
    % Return
    % ------
    %   f: Callable mapping (d, n) -> (1, n) representing the transformed
    %      derivative of f_ref of the given order
    
    % Get the requested reference partial derivative
    pf = f_ref.Derivative(order);
    
    % Set up reused variables for tensor contractions
    total_order = sum(order);
    k_indices = zeros(1, total_order);
    i = 1;
    for j_ = 1 : f_ref.d
        for m = 1 : order(j_)
            k_indices(i) = j_;
            i = i + 1;
        end
    end
    
    i_multi = cell(1, total_order);
    multi_size = f_ref.d * ones(1, total_order);
    num_terms = f_ref.d ^ total_order;

    % The callable we will return
    function y = EvalTransformed(x)
        % x: (d, n) input
        % y: (1, n) transformed output
        
        % Transform input
        x_ref = A * x + b;

        % Skip complicated step below if we are just transforming the
        % function itself
        if sum(order) == 0
            y = pf(x_ref);
            return;
        end
        
        % Use tensor contraction for general derivative transformation
        
        % Summation loop
        y = Zero(x);
        for i_flat = 1 : num_terms
            % Get summation multi-index from flat index
            if total_order == 1  % ind2sub does not work when total_order == 1
                i_multi{1} = i_flat;
            else
                [i_multi{:}] = ind2sub(multi_size, i_flat);
            end
            
            % Get effective derivative order
            cur_order = zeros(1, f_ref.d);
            for j = 1 : total_order
                cur_order(i_multi{j}) = cur_order(i_multi{j}) + 1;
            end

            % Calculate derivative
            df = f_ref.Derivative(cur_order);
            p = df(x_ref);  % (1, n)
            
            % Product loop
            for j = 1 : total_order
                p = p * A(i_multi{j}, k_indices(j));
            end

            % Accumulate term
            y = y + p;
        end
    end
    
    f = @EvalTransformed;
end