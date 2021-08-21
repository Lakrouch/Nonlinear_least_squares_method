clear all;
close all;
data = load('data3.txt');
X = data(:, 1);
Y = data(:, 2);
S = data(:,3);
figure;
plot(X, Y);
xlabel('X');
ylabel('Y');
title('Y(X)');


a = [2, 1];
normal = nlinfit(X, Y, @normal_func, a);

s = 2;
releu = nlinfit(X, Y, @releu_func, s);

n = 2;
[chi_sq, r, j, covb] = nlinfit(X, Y, @chi_sq_func, n);

N = size(X);
N = N(1);
chi_sq_1 = sum(((normal_func(normal, X)-Y)./S).^2);
chi_sq_v_1 = chi_sq_1/(N-2-1);
chi_sq_2 = sum(((releu_func(releu, X)-Y)./S).^2);
chi_sq_v_2 = chi_sq_2/(N-1-1);
chi_sq_3 = sum(((chi_sq_func(chi_sq, X)-Y)./S).^2);
chi_sq_v_3 = chi_sq_1/(N-1-1);

hold on 
plot(X,normal_func(normal,X),'green');

plot(X,releu_func(releu,X),'yellow');

plot(X,chi_sq_func(chi_sq,X),'red');

R = (Y - chi_sq_func(chi_sq, X))./S;

figure;
plot(X, R);
title('График взвешенных остатков');
xlabel('X');
ylabel('R');

A = [ ];
for K = 1 : 100
    A = [A; autocor_func(R, N, K)];
end

figure
plot(1:100, A);
title('График автокорреляционной функции взвешенных остатков');
xlabel('K');
ylabel('A');

disp('Доверительный интервал nlparci');
ci = nlparci(chi_sq, r, 'covar', covb, 'alpha', 0.32);
disp(ci);

disp('Расчитаный доверительный интервал');
ci2(1,1) = chi_sq + tinv(0.16, 199)*sqrt(covb(1,1));
ci2(1,2) = chi_sq + tinv(0.84, 199)*sqrt(covb(1,1));
disp(ci2);