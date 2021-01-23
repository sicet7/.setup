#!/bin/sh
sudo apt install -y ranger && \
mkdir -p "$HOME/.config/ranger" && \
cp "$SETUP_ROOT/config/rc.conf" "$HOME/.config/ranger/rc.conf" && \
echo "Installed ranger"
