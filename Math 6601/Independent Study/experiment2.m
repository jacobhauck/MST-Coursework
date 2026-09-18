% In this experiment we demonstrate how the QR method can fail for matrices
% with eigenvalues that have the same magnitude. We examine this both for
% a specific, 3 x 3, problematic matrix as well as for a random real, 
% 10 x 10 matrix. In the case of the 10 x 10 matrix we see how the method
% actually converges to a block-diagonal matrix with 1 x 1 or 2 x 2 
% diagonal blocks. We also show how we can obtain the eigenvalues from the 
% diagonal blocks, with real eigenvalues corresponding to 1 x 1 blocks and
% complex eigenvalues corresponding to 2 x 2 blocks.

% ==== Part 1 ====
% A basic example that messes up the QR method
fprintf("==== Part 1 ====\n");

% Define a simple, yet troublesome matrix
A = [
   2, 3, 4;
  -2, 1, 0;
   1, 2, 0
];

% Use 50 iterations of the basic algorithm and request the last iterate
[~, ~, ~, ~, last] = basicalgorithm(A, -1, 50);

% Observe that the method converges to a matrix that is block--upper
% triangular, not upper triangular; however, the eigenvalues of A can
% still be obtained by finding the eigenvalues of the diagonal blocks.

% First display true eigenvalues
true_values = eig(A);
fprintf("True eigenvalues of A\n");
true_values

% Now display the last iterate
fprintf("Last iteration of QR method\n");
last

% Now display the eigenvalues of the diagonal blocks of last QR iterate
upper_block_vals = eig(last(1:2, 1:2));
fprintf("Eigenvalues of first block\n");
upper_block_vals

% And display the diagonal element of the last iterate
fprintf("Last diagonal element of last iteration: %.05g\n\n", last(end, end));

% ==== Part 2 ====
% A larger example of how the QR method fails
fprintf("==== Part 2 ====\n");

% Mke a random 10 x 10 real matrix
B = rand(10);

% Use 1000 iterations of the basic algorithm
[~, ~, ~, ~, last] = basicalgorithm(B, 0.0, 1000);

% Display true eigenvalues of B
true_values = eig(B);
fprintf("True eigenvalues of B\n");
true_values

% Now display last iterate
fprintf("Last iteration of QR method\n");
last

% Now find the diagonal blocks of the last iteration and use them to
% compute the eigenvalues of B
skip_next = false;
for row = 1:10
    if ~skip_next
        if row == 10 || abs(last(row + 1, row)) < 1e-6
            fprintf("Found 1 x 1 block with eigenvalue: %.05g\n", last(row, row));
            skip_next = false;
        else
            fprintf("Found 2 x 2 block with eigenvalues:\n");
            block_vals = eig(last(row:row+1, row:row+1));
            block_vals
            skip_next = true;
        end
    else
        skip_next = false;
    end
end