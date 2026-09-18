format longg

% Define integrand
f = @(x) exp(x(:, 1).^2 + x(:, 2).^2);  % Note that x(:,1) is x coordinate and x(:, 2) is y coordinate

% Setup arrays
ns = [4, 8, 16, 32, 64, 128];
Qs = zeros(length(ns), 1);

% Get reference nodes and weights
[ref_nodes, ref_weights] = p2_gauss4();

% Do numerical integrations
for i = 1:length(ns)
    Qs(i) = p2_quad_full(f, ns(i), ref_nodes, ref_weights);
end

% Compute table values
orders = log2(abs((Qs(1:end-1) - Qs(end)) ./ (Qs(2:end) - Qs(end))));

% Display table
fprintf(" n       Q              order\n");
fprintf(" ----------------------------\n");
for i = 1:length(ns)
    if i < length(ns)
        fprintf("% 4d     %.09g     %.04g\n", ns(i), Qs(i), orders(i));
    else
        fprintf("% 4d     %.09g\n", ns(i), Qs(i));
    end
end
fprintf("\n");
