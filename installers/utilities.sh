#!/bin/sh
set -e
sudo apt update && sudo apt install -y \
                        software-properties-common \
                        net-tools \
                        bash \
                        wget \
                        curl \
                        htop \
                        apt-transport-https \
                        ca-certificates \
                        openvpn \
                        wireguard \
                        watch
echo "Installed utilities"
