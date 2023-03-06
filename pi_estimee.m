function [pi_chap] = pi_estimee(a0,a1,L,K)
    global p

    % Générer le signal
    theta=a1^(1/p);
    Y=generer(L/2, K, theta);

    L_alpha = [0.01:0.01:0.99];
    
    % Statistique de Test
    T=sum(Y.^p)

    % Calcul du seuil
    lambda = a0 * chi2inv(1 - L_alpha,L)/2

    for i =1:length(L_alpha)
        pi_chap(i) = length(find(T>lambda(i)))/length(T);
    end 
end