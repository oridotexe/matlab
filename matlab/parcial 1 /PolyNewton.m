function [dd,val] = polynewton(x,y,t)
    n = length(x);
    dd = zeros(n, length(y));
    dd(:,1)= y;
    % diferencia dividida 
    for j=2:n
        for i = 1:n-(j-1)
            dd(i,j)=(dd(i+1,j-1)-dd(i,j-1))/(x(i+j-1)-x(i));
        end    
    end

    for j = 2:n
        termino = @(x_val) dd(1, j);
        for k = 1:j-1
            termino_temp = @(x_val) termino(x_val) .* (x_val - x(k));
            termino = @(x_val) termino_temp(x_val);
        end
        polinomio_temp = @(x_val) polinomio(x_val) + termino(x_val);
        polinomio = polinomio_temp;
    end   
    val = polinomio(t);
end

x = [1 2.3 3.6]
y = [1 1.8 3.4]

[dd, val] = polynewton(x, y, 3)
