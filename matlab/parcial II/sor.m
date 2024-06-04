function x = sor(A, b, x0, tol, omega, itmax)
    n = length(b);
    x = x0; 

    for k = 1:itmax
        x_prev = x; 
        for i = 1:n
            sumatoria1 = 0;
            sumatoria2 = 0;

            for j = 1:i-1
                sumatoria1 = sumatoria1 + A(i,j) * x(j);
            end

            for j = i+1:n
                sumatoria2 = sumatoria2 + A(i,j) * x_prev(j);
            end

            x(i) = (1 - omega) * x_prev(i) + (omega / A(i,i)) * (b(i) - sumatoria1 - sumatoria2);
        end

        error = norm(x - x_prev, inf);

        if error < tol
            disp(['Numero de Iteraciones ' num2str(k)]);
            break;
        end
    end

    if k == itmax
        disp('El método SOR no convergió dentro del número máximo de iteraciones.');
    end
end


%%%%%%%%%%% si no me dan omega
function optimal_omega = encontrar_omega_optimo(A)
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;

    omega_start = 0.01;
    omega_end = 1.99;
    omega_step = 0.01;

    optimal_omega = omega_start;
    min_spectral_radius = inf;

    for omega = omega_start:omega_step:omega_end
        G_SOR = inv(D - omega * L) * ((1 - omega) * D + omega * U);
        spectral_radius = max(abs(eig(G_SOR)));
        if (spectral_radius < min_spectral_radius && spectral_radius < 1)
            min_spectral_radius = spectral_radius;
            optimal_omega = omega;
        end
    end
end


A = [(1/2+1/4+1/3) -1/4 -1/3; -1/4 (1/4+1/3+1/5) -1/5; -1/3 -1/5 (1/3+1/3+1/5)];
b = [10; 0; 5/3];
x0 = zeros(size(b)); 
tol = 1e-4; 
itmax = 7;
omega = 1.2;

x = sor(A, b, x0, tol, omega, itmax);
fprintf('Resultado:');
disp(x)

