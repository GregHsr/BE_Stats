clear all
close all

global p 

p=1.5;

%% Partie 1
N1B = 10000;
K1B = 1;
theta = 3.3;
Y1 = generer(N1B,K1B,theta);

figure
histfit(Y1)

moyenne1b = mean(Y1);
variance1b = var(Y1);

[moyennewbth , variancewbth] = param(theta);

N1C = 1000;
K1C = 500;

Y2 = generer(N1C,K1C,theta);

figure
histfit(Y2(:,1))

L_moy = [];
L_var = [];

for j = 1:K1C
    L_moy(end+1) = mean(Y2(:,j));
    L_var(end+1) = var(Y2(:,j));
end

figure
subplot(2,1,1), plot([1:K1C],L_moy, [1:K1C],repelem(moyennewbth,K1C))
subplot(2,1,2), plot([1:K1C],L_var, [1:K1C],repelem(variancewbth,K1C))

%% Partie 2

amv = estimateur_mv(Y2,N1C,K1C);

moy_amv = mean(amv);
var_amv = var(amv);

figure
plot([1:K1C],amv,'.', [1:K1C], repelem(moy_amv,K1C), [1:K1C], repelem(moy_amv-var_amv,K1C), "k", [1:K1C], repelem(moy_amv+var_amv,K1C), "k")

%% Partie 3

% N variable
a0 = 0.9;
a1 = 1.5;
N=[10 20 50];

figure
for i = 1:length(N)
    L = 2*N(i);
    pi = pi_theorique(a0,a1,L);
    subplot(length(N),1,i), plot([0.01:0.01:0.99],pi)
end

%a1 variable
a0 = 0.9;
a1 = [1.2 1.5 2];
N=20;
L = 2*N;

figure
for i = 1:length(a1)
    pi = pi_theorique(a0,a1(i),L);
    subplot(length(a1),1,i), plot([0.01:0.01:0.99],pi)
end

% Simulation

a0 = 0.9
a1 = 1.5
N = 20
K = 1000

pi_est = pi_estimee(a0,a1,2*N,K)

figure
plot([0.01:0.01:0.99],pi_est)

