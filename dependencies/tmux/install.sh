#!/bin/sh

installIfMissing "tmux" "tmux"
installIfMissing "git" "git"
installIfMissing "bash" "bash"
installIfMissing "xclip" "xclip"

#Download TPM
TPM_DIR="$SP/src/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
    rm -rf "$TPM_DIR" && echo "removed: '$TPM_DIR'"
fi
git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"

#TMUX Setup
linkDotFile "$SP/src/.tmux.conf" "$HOME/.tmux.conf"
linkDotFile "$SP/src/.tmux" "$HOME/.tmux"

#Run TPM plugin installer
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
bash ~/.tmux/plugins/tpm/bin/install_plugins
