#!/bin/sh
sudo apt update && sudo apt install -y \
                        bash \
                        wget \
                        curl \
                        htop \
                        apt-transport-https \
                        ca-certificates \
                        openvpn \
                        openresolv \
                        wireguard
