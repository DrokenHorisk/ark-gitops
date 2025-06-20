#!/bin/bash
set -e

echo ">> Mise à jour du serveur ASA..."
<<<<<<< HEAD
<<<<<<< HEAD
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit
=======
sudo /steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit
>>>>>>> 1ef2f87 (Suppression de la commande chmod pour le script SteamCMD dans le script de lancement)
=======
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit
>>>>>>> 61a254d (Ajout de sudo pour exécuter SteamCMD avec les permissions appropriées dans le script de lancement)

# Vérification du binaire ASA
if [ ! -f /usr/games/ark/ASA.exe ]; then
    echo "❌ Fichier ASA.exe introuvable. SteamCMD a peut-être échoué."
    ls -l /usr/games/ark
    exit 1
fi

echo ">> Lancement du serveur ASA..."
cd /usr/games/ark
wine ASA.exe
