FROM scottyhardy/docker-wine:latest

RUN apt-get update && \
    apt-get install -y wget ca-certificates lib32gcc-s1 unzip curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/games/ark

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /usr/games/ark
CMD ["/start.sh"]
