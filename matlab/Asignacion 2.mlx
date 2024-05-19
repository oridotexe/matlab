function graph(eq1, eq2)
    figure;

    fimplicit(eq1, [-10, 10, -10, 10], 'g');
    hold on;
    fimplicit(eq2, [-10, 10, -10, 10]);

    title('Gráfico de las ecuaciones');
    xlabel('x');
    ylabel('y');

    grid on;
    hold off;
end

function [x, iter] = newtonse(F, x0, tol, itmax)
    v = symvar(F);
    J = jacobian(F, v);
    x = x0;
    iter = 0;
    
    while iter < itmax
        iter = iter + 1;
  
        Fx = double(subs(F, v, x'));
        Jx = double(subs(J, v, x'));
        delta_x = Jx \ (-Fx);
        x = x + delta_x;
        if norm(delta_x, inf) < tol
            break;
        end
    end
end

syms x y

x0 = [3.8; 2]; 
tol = 1e-6;
max_iter = 100;

eq1 = (x - 4)^2 + (y - 4)^2 - 5;
eq2 = x^2 + y^2 - 16;
F = [eq1; eq2];

graph(eq1, eq2);
[x, iter] = newtonse(F, x0, tol, max_iter);

disp('Solución encontrada:');
disp(x);
disp(['Número de iteraciones: ', num2str(iter)]);
