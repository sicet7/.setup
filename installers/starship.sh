#!/bin/sh
curl -fsSL https://starship.rs/install.sh | bash -s -- --yes && \
if [ \( -f "$HOME/.bashrc" \) -a \( "$(grep -i 'starship init bash' ~/.bashrc | wc -l)" = "0" \) ]; then echo "eval \"\$(starship init bash)\"" >> "$HOME/.bashrc"; fi && \
echo "Installed Starship prompt."
