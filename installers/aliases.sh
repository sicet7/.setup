#!/bin/sh
cp "$SETUP_ROOT/config/aliases" "$HOME/.aliases" && \
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i '-f ~/.aliases' ~/.bashrc | wc -l)" = "0" \) ]; then echo "if [ -f ~/.aliases ]; then . ~/.aliases; fi" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'HOME/.aliases' ~/.zshrc | wc -l)" = "0" \) ]; then echo "source \$HOME/.aliases" >> "$HOME/.zshrc"; fi && \
echo "Installed aliases"
