#!/bin/sh

# Assert env variables
if [ -z "$SOUND_CARD_NUMBER" ]; then
  echo "ERROR: 'SOUND_CARD_NUMBER' env variable is not defined"
  exit 1
fi
if [ -z "$VOLUME_LEVEL_PERCENT" ]; then
  echo "ERROR: 'VOLUME_LEVEL_PERCENT' env variable is not defined"
  exit 1
fi
if [ -z "$VOLUME_CHANNEL" ]; then
  echo "ERROR: 'VOLUME_CHANNEL' env variable is not defined"
  exit 1
fi
if [ -z "$TELNET_PASSWORD" ]; then
  echo "ERROR: 'TELNET_PASSWORD' env variable is not defined"
  exit 1
fi

# Set default sound card for VLC
echo "defaults.pcm.card $SOUND_CARD_NUMBER" >> /etc/asound.conf
echo "defaults.ctl.card $SOUND_CARD_NUMBER" >> /etc/asound.conf

# Set volume level in percents
amixer set "$VOLUME_CHANNEL" "$VOLUME_LEVEL_PERCENT"%

# Run VLC with telnet interface as a non-root user
su -c "vlc -I telnet --no-dbus --aout=Alsa --telnet-password $TELNET_PASSWORD" vlc
