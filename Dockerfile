FROM ubuntu:22.04

ENV SOUND_CARD_NUMBER="1"
ENV VOLUME_TYPE="PCM"
ENV VOLUME_LEVEL_PERCENT="100"

COPY startup.sh /home/vlc/startup.sh

RUN chmod +x /home/vlc/startup.sh && \
    apt-get update && \
    apt-get install -y linux-sound-base alsa-base alsa-utils vlc && \
    useradd --create-home --groups audio --shell /bin/sh vlc

EXPOSE 4212

WORKDIR /home/vlc/

ENTRYPOINT ["sh", "/home/vlc/startup.sh"]
