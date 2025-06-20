#!/bin/bash

# Lancer Xvfb pour simuler un DISPLAY
Xvfb :0 &
export DISPLAY=:0

# Initialiser Wine
wineboot -u
sleep 5

# Aller dans le dossier de jeu
cd /usr/games/ark || exit 1

# Lancer le serveur (adapter si ASA.exe n'est pas à la racine)
wine ASA.exe
