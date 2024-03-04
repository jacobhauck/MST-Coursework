lambdas = [0, -100, -2100];
ks = [.1, .05, .01, .003, .0005, .0004];

table = zeros(length(ks), 2*length(lambdas));

r = 1;
for k_ = ks
    c = 1;
    for lambda_ = lambdas
        [t_, y_] = fe(k_, lambda_);
        table(r, c) = abs(y_(end) - cos(1));
        c = c + 1;
        
        [t_, y_] = be(k_, lambda_);
        table(r, c) = abs(y_(end) - cos(1));
        c = c + 1;
    end
    r = r + 1;
end

function [t, y] = fe(k, lambda)
    n = ceil(1/k);
    t = linspace(0, 1, n + 1);
    y = zeros(1, n + 1);
    
    y(1) = 1;
    
    for i = 1:n
        y(i+1) = y(i) + k*(lambda*(y(i) - cos(t(i))) - sin(t(i)));
    end
end

function [t, y] = be(k, lambda)
    n = ceil(1/k);
    t = linspace(0, 1, n + 1);
    y = zeros(1, n + 1);

    y(1) = 1;

    for i = 1:n
        y(i+1) = (y(i) - k*(lambda*cos(t(i+1)) + sin(t(i+1)))) / (1 - k*lambda);
    end
end
