#!/bin/sh
sudo apt update && \
sudo apt install -y build-essential \
                    cmake \
                    ncurses-dev \
                    libpcre2-dev \
                    git \
                    gettext && \
git clone --depth="1" --branch="3.1.2" https://github.com/fish-shell/fish-shell.git && \
cd fish-shell && \
cmake . && \
make && \ 
sudo make install && \
cd .. && \
rm -rfv fish-shell && \
echo "Installed Fish."
