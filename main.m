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
histfit(Y1, sqrt(N1B),"weibull");

moyenne1b = mean(Y1);
variance1b = var(Y1);

[moyennewbth , variancewbth] = param(theta);

N1C = 1000;
K1C = 500;

Y2 = generer(N1C,K1C,theta);

figure
histfit(Y2(:,1));

L_moy = [];
L_var = [];

for j = 1:K1C
    L_moy(end+1) = mean(Y2(:,j));
    L_var(end+1) = var(Y2(:,j));
end

figure
subplot(2,1,1), plot([1:K1C],L_moy, [1:K1C],repelem(moyennewbth,K1C));
subplot(2,1,2), plot([1:K1C],L_var, [1:K1C],repelem(variancewbth,K1C));

%% Partie 2

amv = estimateur_mv(Y2,N1C,K1C);

moy_amv = mean(amv);
var_amv = var(amv);

figure
plot([1:K1C],amv,'.', [1:K1C], repelem(moy_amv,K1C), [1:K1C], repelem(moy_amv-var_amv,K1C), "k", [1:K1C], repelem(moy_amv+var_amv,K1C), "k");

%% Partie 3

% N variable
a0 = 0.9;
a1 = 1.5;
N=[10 20 50];

% Dans une boucle
% figure
% for i = 1:length(N)
%     L = 2*N(i);
%     pi = pi_theorique(a0,a1,L);
%     subplot(length(N),1,i), plot([0.01:0.01:0.99],pi)
% end

% Un par un pour effectuer un seul plot
figure
pi10 = pi_theorique(a0,a1,2*N(1));
pi20 = pi_theorique(a0,a1,2*N(2));
pi50 = pi_theorique(a0,a1,2*N(3));

plot([0.01:0.01:0.99],pi10,[0.01:0.01:0.99],pi20,[0.01:0.01:0.99],pi50)

%a1 variable
a0 = 0.9;
a1 = [1.2 1.5 2];
N=20;
L = 2*N;

% Dans une boucle
% figure
% for i = 1:length(a1)
%     pi = pi_theorique(a0,a1(i),L);
%     subplot(length(a1),1,i), plot([0.01:0.01:0.99],pi)
% end

% Un par un pour effectuer un seul plot
figure
pi12 = pi_theorique(a0,a1(1),L);
pi15 = pi_theorique(a0,a1(2),L);
pi2 = pi_theorique(a0,a1(3),L);

plot([0.01:0.01:0.99],pi12,[0.01:0.01:0.99],pi15,[0.01:0.01:0.99],pi2)

% Simulation

a0 = 0.9;
a1 = 1.5;
N = 20;
K = 1000;

pi_est = pi_estimee(a0,a1,2*N,K);

figure
plot([0.01:0.01:0.99],pi_est);

% Comparaison courbes COR

a0 = 0.9;
a1 = 1.5;
N = 20;
K = [50000 1000];
alpha = [0.01:0.01:0.99];

pi_th = pi_theorique(a0,a1,2*N);
pi_est1 = pi_estimee(a0,a1,2*N,K(1));
pi_est2 = pi_estimee(a0,a1,2*N,K(2));

figure
plot(alpha,pi_th,alpha,pi_est1,alpha,pi_est2)

%% Partie 4

load('wind.mat')

figure
histogram(test)

param_est = wblfit(test);

test_tri = sort(test);

vent = [0:0.01:8];
f_repart_th = [];

for i = 1:length(vent)
    f_repart_th(end+1) = 1 - exp(-(vent(i)/param_est(1))^(param_est(2)));
end 

f_repart_mes = [test_tri(1)/sum(test_tri)];

for i = 2:length(test_tri)
    f_repart_mes(end+1) = f_repart_mes(i-1)+test_tri(i)/sum(test_tri);
end 

figure
plot(test_tri,f_repart_mes, vent, f_repart_th)

% Test de Kolmogorov

% Calcul des écarts
L_Eplus = [];
L_Emoins = [];

for i = 1:length(test_tri)
    [D1,D2] = ecarts(test_tri,i);
    L_Eplus(end+1) = D1;
    L_Emoins(end+1) = D2;
end 

D = max(max(L_Emoins),max(L_Eplus))

D_th = kstest(test_tri)
