#!/bin/sh
cd "$SETUP_BUILD" && \
git clone --depth="1" --branch="v0.4.4" https://github.com/neovim/neovim.git && \
cd neovim && \
make CMAKE_BUILD_TYPE=RelWithDebInfo && \
sudo make install && \
rm -rf ~/.config/nvim && \
mkdir -p ~/.config/nvim && \
cp -v "$SETUP_ROOT/config/nvim.vim" "$HOME/.config/nvim/init.vim" && \
echo "Installed NVIM"
