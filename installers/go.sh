#!/bin/sh
mkdir -p "$HOME/.go/path" && \
sudo apt install -y build-essential golang && \
git clone --depth="1" --branch="go1.15.7" https://github.com/golang/go.git "$HOME/.go/root" && \
cd "$HOME/.go/root/src" && \
bash ./all.bash && \
sudo apt remove -y golang && \
sudo apt autoremove -y && \
export GOPATH="$HOME/.go/path" && \
export GOROOT="$HOME/.go/root" && \
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i 'export GOPATH=' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export GOPATH=\$HOME/.go/path" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'export GOPATH=' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export GOPATH=\$HOME/.go/path" >> "$HOME/.zshrc"; fi && \
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i 'GOPATH/bin' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$GOPATH/bin" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'GOPATH/bin' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$GOPATH/bin" >> "$HOME/.zshrc"; fi && \
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i 'export GOROOT=' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export GOROOT=\$HOME/.go/root" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'export GOROOT=' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export GOROOT=\$HOME/.go/root" >> "$HOME/.zshrc"; fi && \
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i 'HOME/.go/root/bin' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$HOME/.go/root/bin" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'HOME/.go/root/bin' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$HOME/.go/root/bin" >> "$HOME/.zshrc"; fi && \
export PATH="$PATH:$HOME/.go/path/bin:$HOME/.go/root/bin" && \
echo "Installed golang"
