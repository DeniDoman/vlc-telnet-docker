FROM ubuntu:22.04

ENV SOUND_CARD_NUMBER="0"
ENV VOLUME_CHANNEL="Master"
ENV VOLUME_LEVEL_PERCENT="100"

COPY startup.sh /home/vlc/startup.sh

RUN chmod +x /home/vlc/startup.sh && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y linux-sound-base alsa-base alsa-utils vlc && \
    useradd --create-home --groups audio --shell /bin/sh vlc

EXPOSE 4212

WORKDIR /home/vlc/

ENTRYPOINT ["sh", "/home/vlc/startup.sh"]
