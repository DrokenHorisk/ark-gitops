FROM scottyhardy/docker-wine:latest

RUN apt-get update && apt-get install -y \
    xvfb curl unzip wget ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Ajouter un utilisateur non root
RUN useradd -m wineuser

# Installer SteamCMD
RUN mkdir -p /steamcmd && cd /steamcmd \
 && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - \
 && chmod +x /steamcmd/linux32/steamcmd \
 && ln -sf /steamcmd/linux32/steamcmd /steamcmd/steamcmd.sh \
 && chown -R wineuser:wineuser /steamcmd

# Copier et rendre exécutable le script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Travailler depuis le home de l'utilisateur
WORKDIR /home/wineuser

USER wineuser

ENTRYPOINT ["/start.sh"]
