#!/bin/bash
set -e

echo ">> Mise à jour du serveur ASA..."
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit

# Vérification du binaire ASA
if [ ! -f /usr/games/ark/ASA.exe ]; then
    echo "❌ Fichier ASA.exe introuvable. SteamCMD a peut-être échoué."
    ls -l /usr/games/ark
    exit 1
fi

echo ">> Lancement du serveur ASA..."
cd /usr/games/ark
wine ASA.exe
