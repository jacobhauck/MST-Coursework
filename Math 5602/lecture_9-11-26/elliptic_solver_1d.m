function solution = elliptic_solver_1d()
    % Mesh and element data structures
    [P, T] = generate_mesh();
    Pb = P;
    Tb = T;

    % Assemble A
    A = assemble_stiffness_matrix_elliptic_1d();

    % Assemble b
    b = assemble_load_vector_elliptic_1d();

    % Boundary conditions
    [A, b] = apply_dirichlet_boundary_conditions_1d(A, b);

    % Solve
    solution = A \ b;
end