#!/bin/bash

# Détecter l'orientation de l'écran et afficher le clavier visuel en mode portrait
monitor-sensor | while read -r line; do
    echo "Ligne reçue : $line"  # Log pour voir ce que `monitor-sensor` envoie

    if echo "$line" | grep -q "Accelerometer orientation changed: normal"; then
        echo "Mode paysage détecté : masquer le clavier visuel"  # Log pour le mode paysage
        gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false
    elif echo "$line" | grep -q "Accelerometer orientation changed: left-up"; then
        echo "Mode portrait détecté : afficher le clavier visuel"  # Log pour le mode portrait
        gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled true
    elif echo "$line" | grep -q "Accelerometer orientation changed: right-up"; then
        echo "Mode portrait inversé détecté : afficher le clavier visuel"  # Log pour le mode portrait inversé
        gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled true
    fi
done
