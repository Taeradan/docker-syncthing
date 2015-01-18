#!/bin/bash

CONFIGURATION="$HOME/.config/syncthing"
SYNC_FOLDER="$HOME/Sync"

if [ -e $CONFIGURATION ]
then
    mkdir -p $CONFIGURATION
fi

docker run \
    -d \
    --name syncthing \
    --restart always \
    -p 8080:8080 -p 22000:22000 -p 21025:21025/udp \
    -v $CONFIGURATION:/home/syncthing/.config/syncthing \
    -v $SYNC_FOLDER:/home/syncthing/Sync \
    taeradan/syncthing
