#!/bin/bash

echo ">> Début du script start.sh"
echo "UID=$(id -u), GID=$(id -g), whoami=$(whoami)"

echo ">> Contenu du dossier /steamcmd :"
ls -l /steamcmd

echo ">> Exécution de SteamCMD pour mettre à jour ASA"
/steamcmd/steamcmd.sh +force_install_dir /usr/games/ark +login anonymous +app_update 2430930 validate +quit

echo ">> Contenu du dossier /usr/games/ark après install :"
ls -l /usr/games/ark

echo ">> Lancement du serveur ASA..."
export DISPLAY=:99
Xvfb :99 -screen 0 1024x768x16 &
sleep 2

wine /usr/games/ark/ASA.exe -log
