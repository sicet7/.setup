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
mkdir -p "$HOME/.config/fish/functions" && \
cp -rv "$SETUP_ROOT/config/fish/functions/." "$HOME/.config/fish/functions/" && \
cp -v "$SETUP_ROOT/config/fish/config.fish" "$HOME/.config/fish/config.fish" && \
cp -v "$SETUP_ROOT/config/fish/aliases.fish" "$HOME/.config/fish/aliases.fish" && \
echo "Installed Fish."
