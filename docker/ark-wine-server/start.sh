#!/bin/bash
set -e

# Lancer serveur X virtuel
Xvfb :0 &

# Attendre un peu que Xvfb soit prêt
sleep 2

export DISPLAY=:0

# Optionnel : mise à jour ARK
/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/games/ark +app_update 2430930 validate +quit

# Lancer le serveur
wine /usr/games/ark/ShooterGame/Binaries/Win64/ShooterGameServer.exe TheIsland?SessionName="ARK NAS"?MaxPlayers=10?listen -server -log
