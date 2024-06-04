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

syms x y z
x0 = [0.1; 0.1; -0.1];
tol = 1e-5;
max_iter = 100;

eq1 = 3*x - cos(y*z) - 0.5;
eq2 = x^2 - 81*(y + 0.1)^2 + sin(z) + 1.06;
eq3 = exp(-(x*y)) + (10*pi - 3)/3 + 20*z;
F = [eq1; eq2; eq3];


[x, iter] = newtonse(F, x0, tol, max_iter);
disp('Solucion encontrada:');
disp(x);
disp(['Numero de iteraciones: ', num2str(iter)]);
