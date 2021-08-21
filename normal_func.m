function Y = normal_func(a, X)
Y = (1/(a(1).*sqrt(2*pi)))*exp(-(((X-a(2)).^2)/(2*(a(2)^2))));