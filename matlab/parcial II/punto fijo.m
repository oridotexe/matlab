function [x, iter] = punto_fijo(G, x0, tol, max_iter)
    iter = 0;
    error = inf;
    xn = G(x0(1), x0(2));

    while error > tol && iter < max_iter
        iter = iter + 1;
        xn = G(x0(1), x0(2));
        error = norm(xn - x0, inf);
        x0 = xn;
    end
    x = xn;
end

G = @(x,y) [0.25*(sin(x) - cos(y)); sqrt(5*x^2)];  
x0 = [0.25, 0.25];
tol = 1e-6;
max_iter = 1000;

[x, iter] = punto_fijo(G, x0, tol, max_iter);
fprintf('Solución aproximada: %f, %f\n', x(1), x(2));
fprintf('Número de iteraciones realizadas: %d\n', iter);
