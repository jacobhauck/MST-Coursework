function [vals, varargout] = basicalgorithm(A, epsilon, max_iter)
% Find the eigenvalues and eigenvectors of A using the basic QR algorithm
% Parameters
% ----------
%   A: matrix with separated, nonzero eigenvalues
%   epsilon: stopping tolerance for QR iteration
%   max_iter: maximum number of QR iterations
% 
% Return
% ------
%   vals: (n, 1) the eigenvalues of A
%   OR
%   [vals, vectors]
%   vectors: (n, n) matrix whose columns are the eigenvectors of A
%            corresponding to vals
%   OR
%   [vals, vectors, k]
%   k: Number of QR iterations performed
%   
%   OR
%   [vals, vectors, k, errors]
%   errors: (k, 1) array of error values used in the stopping criterion on
%           each step
%  
%   OR
%   [vals, vectors, k, errors, last]
%   last: (n, n) the last matrix in the QR iteration

% Process requested outputs
if nargout >= 2
    need_vectors = true;
else
    need_vectors = false;
end

if nargout >= 4
    need_errors = true;
    errors = zeros(max_iter, 1);
else
    need_errors = false;
end

% Reduce to Hessenberg form
if need_vectors
    % Only track similarity transform if we need to get the eigenvectors
    [Q_running, H] = hess(A);
else
    H = hess(A);
end

% Run iteration
for k = 1:max_iter
    [Q, R] = hessqr(H);
    H = R * Q;

    if need_vectors
        Q_running = Q_running * Q;  % Multiply on the right
    end
    
    error_value = stopping_criterion_error(H);
    if need_errors
        errors(k) = error_value;
    end

    if error_value < epsilon
        break;
    end
end

vals = diag(H);

if need_vectors  
    % Compute eigenvectors of H assuming upper-triangularity
    vectors = triu_eigenvectors(H);

    % Back-transform by the complete, computed similarity transformation
    varargout{1} = Q_running * vectors;
end

if nargout >= 3
    varargout{2} = k;  % Report number of iterations to reach tolerance
end

if need_errors
    varargout{3} = errors(1:k);
end

if nargout >= 4
    varargout{4} = H;
end

end


function error_value = stopping_criterion_error(H)
% Compute the error between H and an upper triangular matrix by getting the
% maximum absolute value of the entries in the lower triangular part of H.
% Parameters
% ----------
%   H: (n,n) matrix to check for approximate upper-triangularity
%
% Return
% ------
%   error_value: Max absolute value of the lower triangular entries of H

error_value = max(max(abs(tril(H, -1))));

end

function vectors = triu_eigenvectors(H)
% Get the eigenvectors of H assuming upper-triangularity
% Parameters
% ----------
%   H: upper-triangular matrix to find the eigenvectors of
%
% Return
% ------
%   vectors: (n, n) matrix whose columns are eigenvectors of H

n = size(H, 1);
vectors = zeros(n, n);
vectors(1, 1) = 1;
for k = 2:n
    vectors(k, k) = 1;
    for j = (k-1):-1:1
        vectors(j, k) = H(j, j+1:k) * vectors(j+1:k, k) / (H(k, k) - H(j, j));
    end
    vectors(1:k, k) = vectors(1:k, k) / norm(vectors(1:k, k));
end

end