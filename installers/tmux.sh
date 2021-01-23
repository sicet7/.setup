#!/bin/sh
cd "$SETUP_BUILD" && \
git clone --depth="1" --branch="3.1c" https://github.com/tmux/tmux.git && \
cd tmux && \
sudo apt install -y autoconf automake pkg-config libevent-dev bison && \
sh ./autogen.sh && \
./configure && \
make && \
sudo make install && \
cp "$SETUP_ROOT/config/.tmux.conf" "$HOME/.tmux.conf" && \
echo "Installed TMUX"
