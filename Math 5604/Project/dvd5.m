function result = dvd5(M, h)
    % Compute D(VD_5'z). The Jacobian is constant, so we omit the z 
    % parameter

    % Construct main diagonal
    mat_size = (M+1)^2;
    rows = 1:mat_size;
    cols = 1:mat_size;
    vals = (-4/h^2) * ones(1, mat_size);

    % === j = j' off-diagonal ===
    % Case: i = i' + 1, so m = m' + (M+1), must have 1 <= i' <= M, and
    % 2 <= i <= M+1
    rows = [rows (1 + (M+1)):mat_size];
    cols = [cols 1:(mat_size - (M+1))];
    vals = [vals (1/h^2)*ones(1, mat_size - (M+1))];

    % Case: i = 1, i' = M + 1 (BC where i = i' + 1 mod (M+1))
    rows = [rows 1:(M+1)];
    cols = [cols (mat_size - (M+1) + 1):mat_size];
    vals = [vals (1/h^2)*ones(1, M+1)];

    % Case: i = i' - 1, so m = m' - (M+1), must have 2 <= i <= M, and
    % 1 <= i <= M
    rows = [rows 1:(mat_size - (M+1))];
    cols = [cols (1 + (M+1)):mat_size];
    vals = [vals (1/h^2)*ones(1, mat_size - (M+1))];

    % Case i = M + 1, i' = 1 (BC where i = i' - 1 mod (M+1))
    rows = [rows (mat_size - (M+1) + 1):mat_size];
    cols = [cols 1:(M+1)];
    vals = [vals (1/h^2)*ones(1, M+1)];

    % === i = i' off-diagonal ===
    % Case j = j' + 1, so m = m' + 1, must have 1 <= j' <= M and
    % 2 <= j <= M+1, so m' (cols) skips multiples of M+1, m (rows)
    % skips numbers that are = 1 mod (M+1)
    % Add *all* rows and columns
    rows = [rows 2:mat_size];
    cols = [cols 1:(mat_size - 1)];
    vals2 = (1/h^2) * ones(1, mat_size - 1);
    % Zero the skipped indices (multiples of M+1)
    vals2(M+1 : M+1 : end) = 0;
    vals = [vals vals2];

    % Case j = M+1, j' = 1 (BC where j = j' + 1 mod (M+1))
    rows = [rows (M+1) : (M+1) : mat_size];
    cols = [cols 1 : (M+1) : mat_size];
    vals = [vals (1/h^2) * ones(1, M+1)];

    % Case j = j' - 1, so m = m' - 1, must have 2 <= j' <= M+1 and
    % 1 <= j <= M, so m (rows) skips multiples of M+1, m' (cols)
    % skips numbers that are = 1 mod (M+1)
    % Add *all* rows and columns
    rows = [rows 1:(mat_size - 1)];
    cols = [cols 2:mat_size];
    vals2 = (1/h^2) * ones(1, mat_size - 1);
    % Zero the skipped indices (multiples of M+1)
    vals2(M+1 : M+1 : end) = 0;
    vals = [vals vals2];

    % Case j = M+1, j' = 1 (BC where j = j' - 1 mod (M+1))
    rows = [rows 1 : (M+1) : mat_size];
    cols = [cols (M+1) : (M+1) : mat_size];
    vals = [vals (1/h^2) * ones(1, M+1)];

    result = sparse(rows, cols, vals);
end