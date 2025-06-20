#!/bin/bash
echo ">> Mise à jour du serveur ASA..."
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit
=======
sudo /steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit
>>>>>>> 1ef2f87 (Suppression de la commande chmod pour le script SteamCMD dans le script de lancement)
=======
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit
>>>>>>> 61a254d (Ajout de sudo pour exécuter SteamCMD avec les permissions appropriées dans le script de lancement)
=======
>>>>>>> 38a6522 (Nettoyage du Dockerfile et mise à jour du script de lancement pour simplifier l'installation de SteamCMD et améliorer la gestion des erreurs.)

# Exécute steamcmd sans changer ses permissions
/steamcmd/steamcmd.sh +force_install_dir /usr/games/ark +login anonymous +app_update 2430930 validate +quit

echo ">> Lancement du serveur ASA..."
cd /usr/games/ark
wine ASA.exe -ServerMap=TheIsland -log
