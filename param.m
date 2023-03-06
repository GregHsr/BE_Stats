function [moyth, varth] = param(theta)
%Calcul de la moyenne et variance théoriques d'une loi de Weibull
    global p 
    moyth = theta * gamma(1+1/p);
    varth = theta * theta * gamma(1 + 2/p) - moyth * moyth;
end