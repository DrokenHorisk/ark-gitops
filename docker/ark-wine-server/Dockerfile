FROM scottyhardy/docker-wine:latest

# Installer SteamCMD
RUN apt-get update && \
    apt-get install -y wget ca-certificates lib32gcc-s1 unzip curl && \
    mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

# Créer répertoire du jeu dans le conteneur
RUN mkdir -p /usr/games/ark

# Copie du script de lancement
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /usr/games/ark

CMD ["/start.sh"]
