function [r, iter, x1_Array] = newtonra(f, df, x0, tol, itmax)
  
    x1_Array = zeros(itmax, 1);

    %Se tiene que inicializar en 1 para que pueda funcionar con los array
    iter = 1;

    x1 = x0 - (f(x0) / df(x0));
    x1_Array(iter) = x1;
       
    while abs(x1 - x0) > tol  && iter < itmax   
        x0 = x1;
        x1 = x0 - (f(x0) / df(x0));
        x1_Array(iter) = x1;
        iter = iter + 1;
        display(x1)
    end
    r = x1;
    %Se acomoda ese comportamiento una vez se termine el ciclo
    iter = iter -1;
end

% Funcion para graficar la funcion y las rectas tangentes
function graph(iter, x1_Array,f,df) 
    
    x_values = linspace(0, 1);
    F_values = f(x_values);

    plot(x_values, F_values);
    hold on;  
   
    for i = 1:iter
     

        plot(x1_Array(i), f(x1_Array(i)), "r*")
       
        tangent_line = df(x1_Array(i))*(x_values - x1_Array(i));
        plot(x_values,tangent_line)
        
    end
end

% ----- Valores y ecuaciones -----
q = 2*10^-5;
ep = 8.85* 10^-12;
a = 0.9;

f = @ (x) ((1 ./ (4*pi* ep)) .* (( q * q * x) ./ ((x.^2 + a^2).^(3/2))) - 1);
df = @ (x) ((1 ./ (4*pi* ep) .* ( q .* q .* (a^2 - 2.*x^2)) ./ ((x^2 + a^2)^(5/2))));
% --------------------------------

[r, iter, x1_Array] = newtonra(f, df, 0, 10^-6, 50);
fprintf("La raiz de la funcion es: %f", r)
fprintf("El numero de iteraciones es: %i", iter)
graph(iter,x1_Array,f,df);

