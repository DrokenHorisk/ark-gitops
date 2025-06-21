#!/bin/bash
set -e

echo ">> Lancement Xvfb..."
Xvfb :0 &
sleep 2
export DISPLAY=:0

echo ">> Initialisation de Wine..."
wineboot || { echo "wineboot a échoué"; exit 1; }

echo ">> Lancement du serveur ARK..."
wine /usr/games/ark/ShooterGame/Binaries/Win64/ShooterGameServer.exe \
  TheIsland?SessionName="ARK NAS"?MaxPlayers=10?listen -server -log || {
    echo "Le serveur ARK a échoué à se lancer"
    exit 2
}

echo ">> Le serveur s'est lancé correctement."
