#!/bin/sh
cd "$SETUP_BUILD" || exit 1;
git clone --depth="1" --branch="3.2a" https://github.com/tmux/tmux.git
cd tmux || exit 1;
sudo apt install -y build-essential autoconf automake pkg-config libevent-dev bison xclip ncurses-dev
sh ./autogen.sh
./configure
make
sudo make install
cp "$SETUP_ROOT/config/tmux.conf" "$HOME/.tmux.conf"
if [ \( -f "/usr/local/bin/tmux" \) -a \( "$(grep -i '/usr/local/bin/tmux' /etc/shells | wc -l)" = "0" \) ]; then
    echo "/usr/local/bin/tmux" | sudo tee -a /etc/shells;
fi
echo "Installed TMUX"
