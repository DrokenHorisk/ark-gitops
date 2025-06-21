FROM scottyhardy/docker-wine:latest

# Install dependencies
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

# Set Wine environment variables
ENV WINEPREFIX=/root/.wine
ENV WINEARCH=win64
ENV XDG_RUNTIME_DIR=/tmp/runtime-root

# Create runtime directory for Wine and initialize with xvfb
RUN mkdir -p $XDG_RUNTIME_DIR && chmod 700 $XDG_RUNTIME_DIR && \
    xvfb-run wineboot --init && \
    xvfb-run winetricks -q vcrun2015 d3dx9

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
