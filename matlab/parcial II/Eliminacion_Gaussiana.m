function [x] = solve_Gauss1(A, b)
    Aug = [A b];
    [n, m] = size(Aug);
    for i = 1:n
        Aug(i, :) = Aug(i, :) / Aug(i, i);
        for j = i+1:n
            Aug(j, :) = Aug(j, :) - Aug(j, i) * Aug(i, :);
        end
    end

    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = Aug(i, end) - Aug(i, 1:end-1) * x;
    end
end


A=[58.9 0.03; -6.10 5.31];
b=[59.2; 47.0];

[x] = solve_Gauss1(A,b)
display(x)
