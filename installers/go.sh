#!/bin/sh
sudo apt install golang && \
if [ \( -f "$HOME/.bashrc" \) -a \( "$(grep -i 'export GOPATH=' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export GOPATH=\$HOME/.go" >> "$HOME/.bashrc"; fi && \
if [ \( -f "$HOME/.zshrc" \) -a \( "$(grep -i 'export GOPATH=' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export GOPATH=\$HOME/.go" >> "$HOME/.zshrc"; fi && \
echo "Installed golang"
