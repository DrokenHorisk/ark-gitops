#!/bin/bash
set -e

export XDG_RUNTIME_DIR=/tmp/xdg
mkdir -p "$XDG_RUNTIME_DIR"

echo ">>> Initialisation de Wine..."
wineboot --init || true

echo ">>> Configuration du bureau virtuel..."
wine reg add "HKCU\\Software\\Wine\\Explorer\\Desktops" /v Default /d 1024x768 /f || true

echo ">>> Lancement de Xvfb..."
Xvfb :0 -screen 0 1024x768x16 &
export DISPLAY=:0
sleep 5

echo ">>> Installation ou mise à jour du serveur ARK ASA avec SteamCMD..."
STEAM_USER="${STEAM_USER:-anonymous}"
STEAM_PASS="${STEAM_PASS:-}"
STEAM_AUTH="${STEAM_AUTH:-}"

LOGIN_ARGS="+login ${STEAM_USER}"
if [ "$STEAM_USER" != "anonymous" ]; then
  LOGIN_ARGS="$LOGIN_ARGS $STEAM_PASS $STEAM_AUTH"
fi

/steamcmd/steamcmd.sh \
  $LOGIN_ARGS \
  +@sSteamCmdForcePlatformType windows \
  +force_install_dir /home/wineuser/ark \
  +app_update 2430930 validate \
  +quit || true

echo ">>> Lancement du serveur ARK ASA..."
cd /home/wineuser/ark
wine ArkAscendedServer.exe || true

echo ">>> Le conteneur reste actif pour debug si le serveur s'arrête."
tail -f /dev/null
