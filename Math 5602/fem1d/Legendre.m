function c = Legendre(n)
    % Generates coefficients of degree-n Legendre polynomial
    % 
    % Parameters
    % ----------
    %   n: degree
    % 
    % Return
    % ------
    %   c: (1, n + 1) coefficients of degree-n Legendre polynomial, in order
    %      from lowest-degree to highest-degree
    
    if n == 0
        c = 1;
    elseif n == 1
        c = [0, 1];
    else
        k = 1;
        c_km1 = [1, zeros(1, n)];
        c_k = [0, 1, zeros(1, n-1)];
        
        while k < n
            c_kp1 = ((2*k + 1) * [0, c_k(1 : end-1)] - k*c_km1) / (k+1);
            k = k + 1;
            c_km1 = c_k;
            c_k = c_kp1;
        end
    
        c = c_k;
    end
end