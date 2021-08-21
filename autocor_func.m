function A = autocor_func(R, N, K)
raz = N-K+1;
chisl = 0;
znam = 0;
for i = 1:raz
    chisl = chisl + R(i)*R(i+K-1);
end
for i = 1:N
    znam = znam +R(i)*R(i);
end
chisl = chisl/raz;
znam = znam/N;
A = chisl/znam;