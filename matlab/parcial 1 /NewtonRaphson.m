function [r, iter] = newtonra(f, df, x0, tol, itmax)
    iter = 1;
    x1 = x0 - (f(x0) / df(x0));
   
     while abs(x1 - x0) > tol  && iter <= itmax
         iter = iter + 1;
         x0 = x1;
         x1 = x0 - (f(x0) / df(x0));
     end
     r = x1;
end

f = @(x) x - ((1e-10 / 81e-12) * (1 + (abs(x) / 0.6))^0.44);
df = @(x) 0.90534*x / abs(x) * (1.66666* abs(x) + 1 )^0.56; 

[r, iter] = newtonra(f, df, 1, 10^-10, 10);
fprintf("La raiz de la funcion es 1: %f", r)
fprintf("El numero de iteraciones es: %i", iter)
