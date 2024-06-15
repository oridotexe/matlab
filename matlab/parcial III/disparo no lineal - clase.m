% Ejercicio clase - Metodo del disparo no lineal

% y'' = 2y^3            -1 <= x <= 0
% y(-1) = 1/2, y(0) = 1/3
% h = 0.25


% Paso 1. Disparo inicial
a = -1;
b = 0;
alfa = 1/2;
beta = 1/3;
t1 = (beta - alfa)/ (b - a);

% Paso 2. resolver el PVI

% hacer cambio de variable
F = @(x,w) [w(2); 2*w(1)^3];
AlfaVector = [alfa, t1];

h = 0.25;
x = a:h:b;
n = length(x);
w = zeros(2,n);
w(:,1) = AlfaVector;

for i = 1:4
    w(:,i+1) = w(:,i) + h*F(x(i), w(:,i));
end

disp(w);
g = w(1,5) - beta;
disp(g);
if g == beta
    fprintf('Se encontro la solucion')
    else
        fprintf('No es la solucion') 
end

% grafico
figure(1), clf, plot(x,w(1,:));

% Paso 3. Hacemos un segundo disparo
t2 = 2 * t1;

w1 = zeros(2,n);
w1(:,1) = [alfa; t2];

for i = 1:4
    w1(:,i+1) = w1(:,i) + h*F(x(i), w1(:,i));
end

disp(w1);
g1 = w1(1,5) - beta;
disp(g1);

if g1 == beta
    fprintf('Se encontro la solucion')
    else
        fprintf('No es la solucion') 
end

% grafico
figure(1), hold on, plot(x,w1(1,:), 'r');

% Paso 4. Aplicar metodo de la secante.

error = abs(g1)
tol = 0.01;



while error > tol
    t3 = t2 - ((t2-t1)/(g1 - g))*g1;
    w2 = zeros(2,n);
    w2(:,1) = [alfa; t3];

    for i = 1:4
        w2(:,i+1) = w2(:,i) + h*F(x(i), w2(:,i));
    end
     
    g2 = w2(1,5) - beta;
    disp(g2);
    error = abs(g2);
    t1 = t2;
    t2 = t3;
    g = g1;
    g1 = g2;

    if g2 == beta
        fprintf('Se encontro la solucion')
        else
            fprintf('No es la solucion') 
    end
end

disp(w2);
plot(x, w2(1,:), 'g');
