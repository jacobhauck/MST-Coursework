function result = gauss4_integrator(f, a, b)

nodes = [
    sqrt(3/7 - 2/7 * sqrt(6/5)), ...
    -sqrt(3/7 - 2/7 * sqrt(6/5)), ...
    sqrt(3/7 + 2/7 * sqrt(6/5)), ...
    sqrt(3/7 + 2/7 * sqrt(6/5))
];

weights = [
    (18 + sqrt(30)) / 36, ...
    (18 + sqrt(30)) / 36, ...
    (18 - sqrt(30)) / 36, ...
    (18 - sqrt(30)) / 36
];

local_nodes = nodes * ((b - a) / 2) + (a + b) / 2;
local_weights = weights * ((b - a) / 2);

result = myquad(f, local_nodes, local_weights);
