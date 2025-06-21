FROM scottyhardy/docker-wine:latest

# Install dependencies (Wine + Winetricks + SteamCMD)
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        winetricks \
        cabextract \
        unzip \
        p7zip-full \
        curl \
        wget \
        ca-certificates \
        lib32gcc-s1 \
        lib32stdc++6 \
        libx11-dev \
        libxext-dev \
        xvfb

# Preconfigure Wine and install VC++ + DirectX
ENV WINEPREFIX=/root/.wine
ENV WINEARCH=win64
RUN wineboot --init && \
    winetricks -q vcrun2015 d3dx9

# Install SteamCMD
RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    chmod +x steamcmd.sh linux32/steamcmd

# Create ARK directory
RUN mkdir -p /usr/games/ark

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set working directory
WORKDIR /usr/games/ark

# Entry point
ENTRYPOINT ["/start.sh"]
