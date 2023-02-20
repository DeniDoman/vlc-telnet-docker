# vlc-telnet-docker

This container contains VLC media player configured to be controlled via telnet. I need such a setup for home automation - external audio device (USB speaker) is connected to the Intel NUC where Home Assistant is running. Using [VLC media player via Telnet](https://www.home-assistant.io/integrations/vlc_telnet/) I can control this speaker in a container way.

# Usage

### Running the image

❗`TELNET_PASSWORD` variable must be set to your custom password (not root)
````
docker run \
    -d \
    -p 4212:4212 \
    -e "TELNET_PASSWORD=your_original_password" \
    --device=/dev/snd:/dev/snd \
    quay.io/galexrt/vlc:latest
````

Additionally, you can set the following env variables:

- `SOUND_CARD_NUMBER` (default: `0`) - number of actual sound card in your system. You can use `aplay -l` to see the number assigned to the relevant card. For example, my USB speaker is shown as `card 1`, so I use value `1` here.
- `VOLUME_CHANNEL` (default: `Master`) - name of volume channel to set a volume level. Usually it's a `Master` channel, you can check it using `alsamixer` command. In my case, `PCM` channel is used.
- `VOLUME_LEVEL_PERCENT` (default: `100`) - volume level in percent. I set it to `100` and change via Home Assistant.
