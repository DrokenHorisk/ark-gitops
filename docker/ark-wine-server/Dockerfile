FROM scottyhardy/docker-wine:latest

# Installer dépendances
RUN apt-get update && \
    apt-get install -y wget ca-certificates lib32gcc-s1 unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Installer SteamCMD dans /steamcmd
RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

# Créer le dossier de jeu
RUN mkdir -p /usr/games/ark

# Ajouter le script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /usr/games/ark
CMD ["/start.sh"]
