import numpy as np
import csv
from scipy.io import savemat

# Recupérer les données du csv en séparant les colonnes par des ;

with open('export_infoclimat.csv', 'r') as f:
    reader = csv.reader(f, delimiter=';')
    data = list(reader)

mesure = []
for k in range(6,len(data)):
    mesure.append(float(data[k][8]))

# Convertir les valeurs en m/s

mesure = np.array(mesure)
mesure = mesure/3.6

# Enregistrer la liste dans un fichier .mat
savemat('mesure_Toulouse.mat', {'mesure': mesure})
