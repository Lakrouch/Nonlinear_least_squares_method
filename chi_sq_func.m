function Y = chi_sq_func(n, X)
T = n/2;
Y = (1/((2^T)*gamma(T))).*(X.^(T-1)).*exp(-(X/2));