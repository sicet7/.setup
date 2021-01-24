#!/bin/sh
sudo apt install zsh && \
mkdir -p "$HOME/.zsh" && \
curl -L git.io/antigen > "$HOME/.zsh/antigen.zsh" && \
cat "$SETUP_ROOT/config/zshrc" > "$HOME/.zshrc" && \
echo "Installed zsh."
