function [pi] = pi_theorique(a0,a1,L)
    L_alpha = [0.01:0.01:0.99];
    pi = repelem(0,length(L_alpha));
    for i = 1:length(L_alpha)
        lambda = a0 * chi2inv(1 - L_alpha(i),L)/2;
        pi(i)=1-chi2cdf(2*lambda/a1,L);
    end 
end