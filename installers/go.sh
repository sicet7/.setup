#!/bin/sh
set -e
sudo rm -rf "$HOME/.go"
sudo rm -rf "/usr/local/go"
wget "https://go.dev/dl/go1.20.5.linux-amd64.tar.gz" --output-document="$SETUP_BUILD/go.tar.gz"
sudo tar -C /usr/local -xzf "$SETUP_BUILD/go.tar.gz"
export PATH="$PATH:/usr/local/go/bin"
echo "Installed golang"
