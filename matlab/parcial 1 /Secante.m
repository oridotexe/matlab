function [r, iter] = secante(f, x0, x1, tol, itmax)
    iter = 0;
    r = x1 - ((x1-x0)/(f(x1)-f(x0)))*f(x1); 
    
    while(abs(x1-r) > tol && iter < itmax)
        x0 = x1;
        x1 = r;
        
        iter = iter + 1;
        r = x1 - ((x1-x0)/(f(x1)-f(x0)))*f(x1);
    end
end

f = @(x) x^3 + 3*x^2 -1;

[r,iter] = secante(f, 0, 1, 10^-4, 20);
fprintf("La raiz de la funcion es: %f", r)
fprintf("El numero de iteraciones es: %i", iter)
