global current_newton_step num_iters;
for kappa = [1, 10, 100]
    for n = [64, 1024]
        % Store number of CG iterations on each Newton iteration step
        % Annoyingly, this is most easily done with globals
        current_newton_step = 0;
        num_iters = 0;
        solver(kappa, n, @linear_solver);
        fprintf("kappa = %d, n = %d, Aiters = %f\n", kappa, n, num_iters / current_newton_step);
    end
end


function result = linear_solver(mat, vec)
    global current_newton_step num_iters;
    
    % We know from the analysis that -mat is positive-definite 
    [result, num_steps] = mycg(-mat, -vec, zeros(length(vec), 1), 1e-10, inf);
    
    % Increment global counters
    num_iters = num_iters + num_steps;
    current_newton_step = current_newton_step + 1;
end