# Bureau d'Etude: Etude Statistique de la vitesse du vent

Ce projet est composé d'un code principal **main.m** faisant appel aux différentes fonctions définies dans les fichiers annexes. 
Il est aussi composé d'un code python permettant de récupérer les données météorologiques de la station de Météo France de Toulouse-Blagnac. 

**Attention!** Un module supplémentaire est nécessaire pour l'exécution du code : Sergii Iglin (2023). *Kolmogorov Distribution Functions* (https://www.mathworks.com/matlabcentral/fileexchange/4369-kolmogorov-distribution-functions), MATLAB Central File Exchange. Retrieved March 29, 2023.

#### Liste des fichiers de fonctions

- generer.m
- param.m
- estimateur_mv
- pi_theorique
- pi_estimee

#### Comment faire tourner ce code

- Placer dans un unique répertoire le code main.m ainsi que toutes les fonctions (en dézippant le dossier rendu, ou à l'aide de "git clone" : ``` git clone https://github.com/GregHsr/BE_Stats ``` pour télécharger tous les fichiers dans le répertoire courant).
- Ouvrir ce répertoire dans Matlab.
- Ecrire dans le terminal Matlab:
``` main.m ```
- Exécuter le programme.

#### Autres documents

Ce répertoire contient également un certain nombre de fichiers autres:
- README.md : ce fichier
- rapport_MATHIEU_HUSSER.pdf : le rapport de l'étude
- Martin1999.pdf : le papier de référence
- Be_Stats_vent.pdf : le sujet de l'étude
- wind.mat : fichier de données du sujet
- export_infoclimat.csv : fichier de données météorologiques récupérées sur le site infoclimat
- mesure_Toulouse.mat : fichier de données météorologiques exportées du fichier export_infoclimat.csv
- test_reel.py : code python permettant de récupérer les données météorologiques de la station de Météo France de Toulouse-Blagnac
- .gitignore / .git : fichier / répertoir git
