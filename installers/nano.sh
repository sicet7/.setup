#!/bin/sh
set -e
cd "$SETUP_BUILD" || exit 1;
wget https://nano-editor.org/dist/v7/nano-7.2.tar.gz
tar -zxvf nano-7.2.tar.gz
cd nano-7.2 || exit 1;
sudo apt install -y build-essential libncurses-dev
./configure
make
sudo make install
rm -rf "$HOME/.nano"
mkdir -p "$HOME/.nano"
git clone -c core.symlinks=true --depth="1" --branch="2020.10.10" https://github.com/scopatz/nanorc.git "$HOME/.nano/syntax"
rm -f "$HOME/.nanorc"
cp -v "$SETUP_ROOT/config/nanorc" "$HOME/.nanorc"
echo "Installed Nano"
