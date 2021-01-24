#!/bin/sh
sudo apt install golang && \
export GOPATH="$HOME/.go" && \
if [ \( -f "$HOME/.bashrc" \) -a \( "$(grep -i 'export GOPATH=' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export GOPATH=\$HOME/.go" >> "$HOME/.bashrc"; fi && \
if [ \( -f "$HOME/.bashrc" \) -a \( "$(grep -i 'GOPATH/bin' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$GOPATH/bin" >> "$HOME/.bashrc"; fi && \
if [ \( -f "$HOME/.zshrc" \) -a \( "$(grep -i 'export GOPATH=' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export GOPATH=\$HOME/.go" >> "$HOME/.zshrc"; fi && \
if [ \( -f "$HOME/.zshrc" \) -a \( "$(grep -i 'GOPATH/bin' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$GOPATH/bin" >> "$HOME/.zshrc"; fi && \
echo "Installed golang"
