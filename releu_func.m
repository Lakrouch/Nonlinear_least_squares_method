function Y = releu_func(s,X)
Y = (X./(s^2)).*exp(-((X.^2)/(2*s^2)));