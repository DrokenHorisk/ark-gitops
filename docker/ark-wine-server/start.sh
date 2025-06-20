#!/bin/bash
echo ">> Mise à jour du serveur ASA..."

chmod +x /steamcmd/steamcmd.sh
/steamcmd/steamcmd.sh +force_install_dir /usr/games/ark +login anonymous +app_update 2430930 validate +quit

echo ">> Lancement du serveur ASA..."
cd /usr/games/ark

# Empêche Wine de tenter de créer une fenêtre
export DISPLAY=:99
Xvfb :99 -screen 0 1024x768x16 &

wine ASA.exe -ServerMap=${MAP_NAME:-TheIsland} -log
