function [alpha_est] = estimateur_mv(Y, N, K)
    global p
    alpha_est=sum(Y.^p,1)/N;
end