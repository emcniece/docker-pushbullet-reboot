# Pushbullet-Reboot

A convenient way to get notifications when this container restarts. Uses Alpine Linux with `curl` and `tzdata` packages.

Automatically appends date to the Pushbullet message.

## Running

```
docker run -d \
    -e "TZ=America/Vancouver" \
    -e "PB_API_KEY=x.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
    -e "MSG_TITLE=Server Reboot" \
    -e "MSG_BODY=on" \
    $(DOCKER_IMAGE):$(VERSION)
```

This pushes a notification that looks like:

```
# Server Reboot
on Wed Jan  3 00:16:08 PST 2018
```

## Developing

Makefile contains build commands.

```
make image
make run
make run-debug
```