#!/bin/sh
sudo apt install zsh && \
if [ ! -f "$HOME/.zshrc" ]; then touch "$HOME/.zshrc"; fi && \
echo "Installed zsh."
