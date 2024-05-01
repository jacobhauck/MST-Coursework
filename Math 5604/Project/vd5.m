function result = vd5(z, M, h)
    % Compute VD_5'z

    % z(m(i-1,j))
    left = zeros((M+1)^2, 1);
    left(1+(M+1) : end) = z(1 : end-(M+1));
    left(1 : M+1) = z(end-(M+1)+1 : end);
    
    % z(m(i+1,j))
    right = zeros((M+1)^2, 1);
    right(1 : end-(M+1)) = z(1+(M+1) : end);
    right(end-(M+1)+1 : end) = z(1 : M+1);
    
    % z(m(i,j-1))
    % This is a bit trickier -- if m = 1 mod (M+1), then we need down(m) =
    % z((m-1) + (M+1)), otherwise we need down(m) = z(m-1).
    down = zeros((M+1)^2, 1);
    % Shift *all* indices by 1
    down(2:end) = z(1:end-1);
    % Now correct indices m where m = 1 mod (M+1)
    down(1 : (M+1) : end) = z(M+1 : (M+1) : end);

    % z(m(i,j+1))
    % Now if m = (M+1) mod (M+1), we need up(m) = z((m+1) - (M+1)),
    % otherwise up(m) = z(m+1)
    up = zeros((M+1)^2, 1);
    % Shift *all* indices by 1
    up(1:end-1) = z(2:end);
    % Now correct indices m where m = (M+1) mod (M+1)
    up(M+1 : M+1 : end) = z(1 : (M+1) : end);

    % Add everything up
    result = (left + right + up + down - 4*z) / h^2;
end
