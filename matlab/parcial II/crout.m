function [L,U,x]= tridecrout(A, b)
    n = size(A, 1);  
    L = zeros(n, n);
    U = eye(n);
    y = zeros(n, 1);
    x = zeros(n, 1);

    L(1, 1) = A(1, 1);
    U(1, 2) = A(1, 2) / L(1, 1);
    y(1) = b(1) / L(1, 1);

    % Calcular elementos de L y U 
    for i = 2:n-1
        L(i, i-1) = A(i, i-1);
        L(i, i) = A(i, i) - L(i, i-1) * U(i-1, i);
        U(i, i+1) = A(i, i+1) / L(i, i);
        y(i) = (b(i)  - L(i, i-1) * y(i-1)) / L(i, i);
    end

 
    L(n, n-1) = A(n, n-1);
    L(n, n) = A(n, n) - L(n, n-1) * U(n-1, n);
    y(n) = (b(n)  - L(n, n-1) * y(n-1)) / L(n, n);

    %  Resolver Ux = y
    x(n) = y(n); 
    for i = n-1:-1:1
        x(i) = y(i) - U(i, i+1) * x(i+1);
    end

 end


A =[10 5 0 0; 5 10 4 0; 0 -4 8 -1; 0 0 -1 5];
[L,U,x] = tridecrout(A, b)
