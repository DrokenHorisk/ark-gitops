#!/bin/bash
echo ">> Mise à jour du serveur ASA..."

/steamcmd/steamcmd.sh +force_install_dir /usr/games/ark +login anonymous +app_update 2430930 validate +quit

echo ">> Lancement du serveur ASA..."
cd /usr/games/ark
export DISPLAY=none  # Évite les erreurs X
wine ASA.exe -ServerMap=TheIsland -log
