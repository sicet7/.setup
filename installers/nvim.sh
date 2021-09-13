#!/bin/sh
set -e
cd "$SETUP_BUILD" || exit 1;
git clone --depth="1" --branch="v0.4.4" https://github.com/neovim/neovim.git
cd neovim || exit 1;
sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim
cp -v "$SETUP_ROOT/config/nvim.vim" "$HOME/.config/nvim/init.vim"
echo "Installed NVIM"
