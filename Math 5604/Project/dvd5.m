function result = dvd5(M, h)
    % Compute D(VD_5'z). The Jacobian is constant, so we omit the z 
    % parameter

    % Construct main diagonal
    mat_size = M^2;
    rows = 1:mat_size;
    cols = 1:mat_size;
    vals = (-4/h^2) * ones(1, mat_size);

    % === j = j' off-diagonal ===
    % Case: i = i' + 1, so m = m' + M, must have 1 <= i' <= M-1, and
    % 2 <= i <= M
    rows = [rows (1 + M):mat_size];
    cols = [cols 1:(mat_size - M)];
    vals = [vals (1/h^2)*ones(1, mat_size - M)];

    % Case: i = 1, i' = M (BC where i = i' + 1 mod M)
    rows = [rows 1:M];
    cols = [cols (mat_size - M + 1):mat_size];
    vals = [vals (1/h^2)*ones(1, M)];

    % Case: i = i' - 1, so m = m' - M, must have 2 <= i <= M, and
    % 1 <= i <= M-1
    rows = [rows 1:(mat_size - M)];
    cols = [cols (1 + M):mat_size];
    vals = [vals (1/h^2)*ones(1, mat_size - M)];

    % Case i = M, i' = 1 (BC where i = i' - 1 mod M)
    rows = [rows (mat_size - M + 1):mat_size];
    cols = [cols 1:M];
    vals = [vals (1/h^2)*ones(1, M)];

    % === i = i' off-diagonal ===
    % Case j = j' + 1, so m = m' + 1, must have 1 <= j' <= M-1 and
    % 2 <= j <= M, so m' (cols) skips multiples of M, m (rows)
    % skips numbers that are = 1 mod M
    % Add *all* rows and columns
    rows = [rows 2:mat_size];
    cols = [cols 1:(mat_size - 1)];
    vals2 = (1/h^2) * ones(1, mat_size - 1);
    % Zero the skipped indices (multiples of M)
    vals2(M : M : end) = 0;
    vals = [vals vals2];

    % Case j = M, j' = 1 (BC where j = j' + 1 mod M)
    rows = [rows M : M : mat_size];
    cols = [cols 1 : M : mat_size];
    vals = [vals (1/h^2) * ones(1, M)];

    % Case j = j' - 1, so m = m' - 1, must have 2 <= j' <= M and
    % 1 <= j <= M-1, so m (rows) skips multiples of M, m' (cols)
    % skips numbers that are = 1 mod M
    % Add *all* rows and columns
    rows = [rows 1:(mat_size - 1)];
    cols = [cols 2:mat_size];
    vals2 = (1/h^2) * ones(1, mat_size - 1);
    % Zero the skipped indices (multiples of M)
    vals2(M : M : end) = 0;
    vals = [vals vals2];

    % Case j = M, j' = 1 (BC where j = j' - 1 mod M)
    rows = [rows 1 : M : mat_size];
    cols = [cols M : M : mat_size];
    vals = [vals (1/h^2) * ones(1, M)];

    result = sparse(rows, cols, vals);
end