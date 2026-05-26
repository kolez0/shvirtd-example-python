#!/bin/bash

FOLDER="/opt/shvirtd-example-python"
REPO="https://github.com/kolez0/shvirtd-example-python.git"

if [ -d "$FOLDER" ]; then
    sudo rm -rf "$FOLDER"
fi

sudo git clone "$REPO" "$FOLDER"

cd "$FOLDER"

docker compose up -d