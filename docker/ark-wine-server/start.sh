#!/bin/bash
set -e

echo ">> Mise à jour du serveur ASA..."
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit

echo ">> Lancement du serveur ASA..."
cd /usr/games/ark
wine ASA.exe
