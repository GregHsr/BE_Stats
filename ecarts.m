function [Eplus,Emoins] = ecarts(test,i)
    N = length(test);
    param_est = wblfit(test);
    Eplus = abs(i/N-wblcdf(test(i),param_est(1),param_est(2)));
    Emoins = abs((i-1)/N-wblcdf(test(i),param_est(1),param_est(2)));
end