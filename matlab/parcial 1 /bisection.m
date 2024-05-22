function [r, iter] = bisection(f, a, b, tol, itmax)
    r = (a + b) / 2;
    iter = 0;
    while (abs(f(r)) > tol) && iter < itmax
        if ((f(a) * f(r)) < 0)
            b = r;
        else 
            a = r;
        end
        r = (a + b) / 2;
        iter = iter + 1;
    end
end 

f = @(x) 10*x^4 -400*x^3+3999.76*x^2+2.16*x-21.6;

[r, iter] = bisection(f, 0, 15, 10^-5, 50);
fprintf("La raiz de la funcion es: %f", r)
fprintf("El numero de iteraciones es: %i", iter)
