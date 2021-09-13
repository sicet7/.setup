#!/bin/sh
set -e
sudo apt update && sudo apt install -y \
                        software-properties-common \
                        bash \
                        wget \
                        curl \
                        htop \
                        apt-transport-https \
                        ca-certificates \
                        openvpn \
                        openresolv \
                        wireguard \
                        watch
echo "Installed utilities"
