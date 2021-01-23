#!/bin/sh
sudo apt update && \
sudo apt install -y curl && \
mkdir -p "$HOME/.config/fish/functions" && \
wget https://git.io/fisher --output-document="$HOME/.config/fish/functions/fisher.fish" && \
cp -v "$SETUP_ROOT/config/fish/fishfile" ~/.config/fish/fishfile && \
echo "Installed Fisher"
