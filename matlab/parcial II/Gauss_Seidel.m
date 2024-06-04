% Declaración de matriz A
A = [1 5 -6; 1 -2 4; 1 1 8];


% El vector b 
b = [-4; 28; 15];


% Condición inicial para el método de Gauss-Seidel

x0 = [0; 0; 0];
tol = 1e-2;
max_iter = 1000;

% Verificacion de convergencia
[convergent, rho] = GS_convergence(A);


% Funcion del metodo de Gauss-Seidel
function [x, iter] = Gauss_seidel(A, b, x0, tol, max_iter)
    n = length(b);
    x = x0;
    iter = 0;
    
    % Iteraciones
    while iter < max_iter
        iter = iter + 1;
        x_old = x;
        
        for i = 1:n
            sum_term = 0;
            
            for j = 1:(i-1)
                sum_term = sum_term + A(i,j) * x(j);
            end
            
            for j = i+1:n
                sum_term = sum_term + A(i,j) * x_old(j);       
            end
            x(i) = (b(i) - sum_term) / A(i,i)
        end
        
        % Verificar criterio de parada
        if norm(x - x_old, inf) < tol
            break;
        end
    end
end


% Funcion de convergencia del metodo de Gauss-Seidel
% calculando el radio espectral

function [convergent, rho] = GS_convergence(A)
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, 1);
    Tj = (D)\(L + U);
    rho = max(abs(eig(Tj)));
  convergent = rho < 1; 
end


% mostrar los valores de A y b
disp('----------------MATRIZ A----------------');
disp(A)
disp('----------------MATRIZ b----------------');
disp(b);

if convergent
    [x, iter] = Gauss_seidel(A, b, x0, tol, max_iter);
    disp('Solución:');
    disp(x);
    fprintf('Iteraciones realizadas: %i', iter);
    fprintf('\nRadio espectral : %.4f', rho);
else
    disp('Sin solución por el metodo de Gauss-Seidel');
end
