function [A_out, b_out] = DirichletBoundary1d(A, b, nodes, values)
    % Applies Dirichlet boundary conditions to the stiffness matrix and
    % load vector
    % 
    % Parameters
    % ----------
    %   A: Current assembly matrix in which to apply Dirichlet boundary
    %      condition
    %   b: Current load vector in which to apply Dirichlet boundary
    %      condititon
    %   nodes: (1, k) finite element nodes at which to apply Dirichlet
    %      boundary condition
    %   values: (1, k) solution values to enforce at the given nodes,
    %      parallel array with nodes
    
    A_out = A;
    b_out = b;
    for i = 1 : length(nodes)
        i_node = nodes(i);
        A_out(i_node, :) = 0.0;
        A_out(i_node, i_node) = 1.0;
        b_out(i_node) = values(i);
    end
end