function [L, U, x] = doolitle(A, b)
    n = size(A, 1);      
    
    L = eye(n);            
    U = zeros(n);           

    % Algoritmo de Doolittle para calcular L y U
    for i = 1:n
        for k = i:n
            U(i, k) = A(i, k) - sum(L(i, 1:i-1) .* U(1:i-1, k)');
        end
        for k = i+1:n
            L(k, i) = (A(k, i) - sum(L(k, 1:i-1) .* U(1:i-1, i)')) / U(i, i);
        end
    end

    % Solución del sistema Ly = b
    y = zeros(n, 1);
    for i = 1:n
        y(i) = (b(i) - sum(L(i, 1:i-1) .* y(1:i-1)')) / L(i, i);
    end

    % Solución del sistema Ux = y
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - sum(U(i, i+1:n) .* x(i+1:n)')) / U(i, i);
    end
end

 A = [5, 5, 0, 0, 0;
      0, 0, 1, -1, -1;
      0, 0, 0, 2, -3;
      1, -1, -1, 0, 0;
      0, 5, -7, -2, 0];

 V = 5;
 b = [V; 0; 0; 0; 0];


 di=[1,5,1,2];
 dm=[5,-1,-7,-1,-3];
 ds=[5,-1,-2,-1];
 Atri= diag(di,-1) + diag(dm) + diag(ds,1);

[x,L,U] = doolitle(Atri, b)
