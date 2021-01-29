#!/bin/sh
sudo rm -rf "$HOME/.go" && \
mkdir -p "$HOME/.go/path" && \
sudo apt install -y build-essential golang && \
hash -r && \
git clone --depth="1" --branch="go1.15.7" https://github.com/golang/go.git "$HOME/.go/root" && \
cd "$HOME/.go/root/src" && \
bash ./all.bash && \
sudo apt remove -y golang && \
sudo apt autoremove -y && \
export GOPATH="$HOME/.go/path" && \
export GOROOT="$HOME/.go/root" && \
export PATH="$PATH:$HOME/.go/path/bin:$HOME/.go/root/bin" && \
echo "Installed golang"
