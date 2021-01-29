#!/bin/sh
sudo apt update && sudo apt -y \
                        wget \
                        curl \
                        htop \
                        apt-transport-https \
                        ca-certificates \
                        openvpn \
                        openresolv \
                        wireguard
