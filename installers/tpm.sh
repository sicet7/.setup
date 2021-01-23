#!/bin/sh
cd "$SETUP_BUILD" && \
rm -rf "$HOME/.tmux/plugins/tpm" && \
mkdir -p "$HOME/.tmux/plugins" && \
git clone --depth="1" --branch="master" https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm" && \
cat "$SETUP_ROOT/config/tpm.conf" >> "$HOME/.tmux.conf" && \
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins" && \
bash ~/.tmux/plugins/tpm/bin/install_plugins && \
echo "Installed Tmux Plugin Manager"
