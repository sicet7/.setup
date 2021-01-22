#!/bin/sh
sudo apt update && \
sudo apt install -y curl && \
curl https://git.io/fisher --create-dirs -o ~/.config/fish/functions/fisher.fish && \
cp -v "$SETUP_ROOT/config/fishfile" ~/.config/fish/fishfile && \
echo "Installed Fisher"
