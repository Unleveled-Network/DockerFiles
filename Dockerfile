# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------

FROM        openjdk:8-jdk

LABEL       author="Taylor Bakken" maintainer="gizmo0320@unleveledgaming.com"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openjfx npm nodejs ant openssl git tar sqlite3 fontconfig tzdata iproute2 libnetty-java \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
