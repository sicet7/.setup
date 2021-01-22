#!/bin/sh
sudo apt update && \
sudo apt install -y curl && \
curl https://git.io/fisher --create-dirs -o ~/.config/fish/functions/fisher.fish && \
echo "Installed Fisher"
