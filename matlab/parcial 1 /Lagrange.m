function [coef, val] = polylagrange(x, y, t)
    n = length(x) - 1;
    coef = zeros(1, n+1);
   
    for i = 1:n+1
        term = y(i);
        for j = 1:n+1
            if j ~= i
                term = conv(term, poly(x(j))) / (x(i) - x(j));
            end
        end
        coef = coef + term;
    end

    val = polyval(coef, t);
end

x = [1.5 2.0 2.2 2.4 2.6];
y = [0.5815 0.5767 0.5560 0.5202 0.4708];

[coef, val] = polylagrange(x, y, 2.1);
fprintf("Los coeficientes son:")
display(coef)
fprintf("La aproximacion es: %f", val)
