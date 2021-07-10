# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------

FROM        openjdk:8-jdk

LABEL       author="Taylor Bakken" maintainer="gizmo0320@unleveledgaming.com"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openjfx openssl git tar sqlite fontconfig tzdata iproute2 i965-va-driver-shaders libasound2-plugins alsa-utils libbluray-bdj colord firmware-crystalhd cups-common gvfs liblcms2-utils opus-tools pciutils librsvg2-bin lm-sensors speex sqlite-doc sqlite3-doc systemd-container policykit-1 nvidia-vdpau-driver nvidia-legacy-340xx-vdpau-driver nvidia-legacy-304xx-vdpau-driver \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
