FROM scottyhardy/docker-wine:latest

RUN apt-get update && \
    apt-get install -y wget ca-certificates lib32gcc-s1 unzip curl && \
    mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    chmod +x steamcmd.sh linux32/steamcmd

RUN mkdir -p /usr/games/ark

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /usr/games/ark
ENTRYPOINT ["/start.sh"]
