#!/bin/sh
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i 'HOME/bin' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$HOME/bin" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'HOME/bin' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$HOME/bin" >> "$HOME/.zshrc"; fi && \
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i 'HOME/.local/bin' ~/.bashrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$HOME/.local/bin" >> "$HOME/.bashrc"; fi && \
if [ \( ! -f "$HOME/.zshrc" \) -o \( "$(grep -i 'HOME/.local/bin' ~/.zshrc | wc -l)" = "0" \) ]; then echo "export PATH=\$PATH:\$HOME/.local/bin" >> "$HOME/.zshrc"; fi && \
echo "Installed Paths."
