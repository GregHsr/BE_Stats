function [Y] = generer(N, K, theta)
    global p 
    X = rand(N,K);      % Matrice de taille NxK avec des nombres compris entre  0 et 1
    Y = zeros(N,K);     % Création d'une matrice remplie de 0 dont les valeurs seront à modifier
    for i=1:N
        for j=1:K
            Y(i,j) = theta * log(1/(1-X(i,j)))^(1/p);  % Utilisation de la fonction de repartition inverse
        end
    end 
end