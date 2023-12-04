function result = myquad(f, nodes, weights)

% nodes and weights are 1 x (m + 1) ROW vectors
result = f(nodes) * weights';