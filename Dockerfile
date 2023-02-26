FROM ubuntu:22.04

COPY startup.sh /home/vlcuser/startup.sh

RUN chmod +x /home/vlcuser/startup.sh && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y linux-sound-base alsa-base alsa-utils vlc && \
    useradd --groups audio --shell /bin/sh vlcuser

EXPOSE 4212

WORKDIR /home/vlcuser/

ENTRYPOINT ["sh", "/home/vlcuser/startup.sh"]
