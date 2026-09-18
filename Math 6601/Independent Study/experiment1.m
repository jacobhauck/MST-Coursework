% In this experiment we estimate the convergence rate of the basic QR
% method.
%
% We apply the method to a random 20 x 20 matrix constructed
% according to the method described in the paper.
% 
% Our goal is to verify that the convergence rate satisfies the estimate
% O(m(k)), where m(k) is defined in equation (???). In our case, we should
% have m(k) = 0.95^k.
%
% We also verify that the method converges to the correct eigenvalues and
% eigenvectors.


function [value_errors, vector_errors] = eig_error(values1, vectors1, values2, vectors2)
% Compute the error between the given sets of eigenvalues and eigenvectors
% by brute-force matching the eigenvectors using maximum absolute cosine 
% similarity and brute-force matching the eigenvalues using distance.
% Parameters
% ----------
%   values1: (n, 1) a set of eigenvalues
%   vectors1: (n, n) a set of eigenvectors packed as the columns of the
%             matrix
%   values2: (n, 1) another set of eigenvalues
%   vectors2: (n, n) another set of eigenvectors
%
% Return
% ------
%   value_errors: (n, 1) errors between the eigenvalues, in no particular
%                 order
%   vector_erros: (n, 1) errors between the eigenvectors (in l^\infty), in
%                 no particular order. Error is computed after normalizing
%                 both eigenvectors to be unit vectors in the same
%                 direction

n = length(values1);

% Compute value errors using brute-force matching.
% We want to establish a 1-1 correspondence between values1 and values2, so
% we have to use a loop here to ensure that one value does not get matched
% to more than one other.
value_errors = zeros(n, 1);
taken = zeros(n, 1);  % whether item in values2 has already been matched
for i = 1:n
    closest = 1;
    closest_dist = inf;
    % Find partner for item i in values1 from among those not already taken
    for j = 1:n
        dist = abs(values1(i) - values2(j));
        if taken(j) == 0 &&  dist < closest_dist
            closest_dist = dist;
            closest = j;
        end
    end
    taken(closest) = 1;  % mark closest as taken
    value_errors(i) = closest_dist;  % save error
end


% Compute vector errors using brute-force matching.
% We use the same algorithm as above with a different distance function.
vector_errors = zeros(n, 1);
taken = zeros(n, 1);  % whether item in values2 has already been matched
for i = 1:n
    closest = 1;
    closest_dist = 0;
    % Find partner for item i in values1 from among those not already taken
    for j = 1:n
        % Absolute cosine similarity--note that we want to find the maximum
        dist = abs((vectors1(:, i)' * vectors2(:, j)) / (norm(vectors1(:, i)) * norm(vectors2(:, j))));
        if taken(j) == 0 &&  dist > closest_dist
            closest = j;
            closest_dist = dist;
        end
    end
    taken(closest) = 1;  % Mark closest as taken
    
    % Now rescale the vectors to be unit vectors in the same direction
    vec1 = vectors1(:, i) / norm(vectors1(:, i));
    [~, index] = max(abs(vectors2(:, closest)));
    vec2 = vectors2(:, closest) * (vec1(index) / vectors2(index, closest));
    vector_errors(i) = max(abs(vec1 - vec2));  % Compute error
end

end

% ==== Part 1 ====
% Check that the eigenvalues and eigenvectors computed by basicalgorithm
% are correct.
fprintf("==== Part 1 ====\n");

% Generate a random complex matrix
[U, ~, ~] = svd(rand(20) + 1i*rand(20));
desired_eigenvalues = (1:20)' .* exp(rand(20, 1) * 2i * pi);
T = diag(desired_eigenvalues) + triu(rand(20) + 1i*rand(20), 1);
A = U * T * U';

% Use QR method to find eigenvalues and eigenvectors
[values, vectors, k] = basicalgorithm(A, 1e-12, 1000);
fprintf("Basic QR iteration converged in %d steps.\n", k);

% Use MATLAB command to find "true" eigenvalues and eigenvectors
[true_vectors, true_values] = eig(A);
true_values = diag(true_values);  % output of eig is returned in a diagonal 
                                  % matrix

% Compute error between QR method and eig
[value_errors, vector_errors] = eig_error(values, vectors, true_values, true_vectors);

% Plot errors
fprintf("Saving error plots\n");
figure;
bar(1:20, value_errors);
xlabel("Eigenvalue Index");
ylabel("Error");
title("Eigenvalue Errors");
set(gca, 'FontSize', 12, 'FontName', 'Times');
saveas(gcf, "value_errors", "pdf");

figure;
bar(1:20, vector_errors);
xlabel("Eigenvector Index");
ylabel("Error")
title("Eigenvector Errors");
set(gca, 'FontSize', 12, 'FontName', 'Times');
saveas(gcf, "vector_errors", "pdf");


fprintf("\n\n");
% ==== Part 2 ====
% Generate a plot of the convergence rate to verify the theoretical result 
fprintf("==== Part 2 ====\n");

% Maximum number of steps for checking convergence
maximum_steps = 600;
% How many steps in between checking the error
step_increment = 1;

% Generate a random complex matrix
[U, ~, ~] = svd(rand(20) + 1i*rand(20));
desired_eigenvalues = (1:20)' .* exp(rand(20, 1) * 2i * pi);
T = diag(desired_eigenvalues) + triu(rand(20) + 1i*rand(20), 1);
A = U * T * U';

% Set epsilon = -1 to force max_iter, and rewuest the errors
steps = 1:maximum_steps;
[~, ~, ~, basic_error] = basicalgorithm(A, -1, maximum_steps);

% Make plot
fprintf("Saving convergence plot\n");
figure;

% Plot computed error with log y axis
semilogy(steps, basic_error);

hold on;
% Plot expected convergence with log y axis
semilogy(steps, 10*0.95.^steps);

xlabel("Steps");
ylabel("Error");
legend("Actual error", "Theoretical error");
title("Convergence of the Basic QR Method");
set(gca, 'FontSize', 12, 'FontName', 'Times');
saveas(gcf, "convergence", 'pdf');