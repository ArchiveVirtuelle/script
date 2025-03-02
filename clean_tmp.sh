#!/bin/bash
#script bash pour nettoyer fichier temporaire

# Définir le répertoire à nettoyer
DIRECTORY="/tmp"

# Définir l'extension des fichiers temporaires
EXTENSION=".tmp"

# Afficher un message de début
echo "Nettoyage des fichiers temporaires dans $DIRECTORY..."

# Supprimer les fichiers avec l'extension spécifiée
find "$DIRECTORY" -type f -name "*$EXTENSION" -exec rm -f {} \;

# Vérifier si la commande précédente a réussi
if [ $? -eq 0 ]; then
    echo "Nettoyage terminé avec succès."
else
    echo "Une erreur s'est produite lors du nettoyage."
fi

# Fin du script
exit 0
