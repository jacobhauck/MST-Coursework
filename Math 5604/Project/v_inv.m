function result = v_inv(b, M)
    % Implementation of V^{-1}. As with v, just use reshape
    result = reshape(b, M, M);
end
