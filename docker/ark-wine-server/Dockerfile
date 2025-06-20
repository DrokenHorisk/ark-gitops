FROM scottyhardy/docker-wine:latest

LABEL maintainer="droken"

USER root

# Installer SteamCMD et dépendances utiles
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    xvfb \
    winbind

# Créer dossier serveur
RUN mkdir -p /usr/games/ark

# Copie du script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
