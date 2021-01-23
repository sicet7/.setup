#!/bin/sh
curl -fsSL https://starship.rs/install.sh | bash -s -- --yes && \
if [ \( -f "$HOME/.bashrc" \) -a \( "$(grep -i 'starship init bash' ~/.bashrc | wc -l)" = "0" \) ]; then echo "eval \"\$(starship init bash)\"" >> "$HOME/.bashrc"; fi && \
if [ \( -f "$HOME/.zshrc" \) -a \( "$(grep -i 'starship init zsh' ~/.zshrc | wc -l)" = "0" \) ]; then echo "eval \"\$(starship init zsh)\"" >> "$HOME/.zshrc"; fi && \
echo "Installed Starship prompt."
