#!/bin/sh
cd "$SETUP_BUILD" && \
wget https://nano-editor.org/dist/v5/nano-5.5.tar.gz && \
tar -zxvf nano-5.5.tar.gz && \
cd nano-5.5 && \
sudo apt install build-essential && \
./configure && \
make && \
sudo make install && \
rm -rf "$HOME/.nano" && \
mkdir -p "$HOME/.nano" && \
git clone -c core.symlinks=true --depth="1" --branch="2020.10.10" https://github.com/scopatz/nanorc.git "$HOME/.nano/syntax" && \
rm -f "$HOME/.nanorc" && \
cp -v "$SETUP_ROOT/config/.nanorc" "$HOME/.nanorc" && \
cd .. && \
echo "Installed Nano"
