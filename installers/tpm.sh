#!/bin/sh
cd "$SETUP_BUILD" || exit 1;
rm -rf "$HOME/.tmux/plugins/tpm"
mkdir -p "$HOME/.tmux/plugins"
git clone --depth="1" --branch="master" https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"
if [ \( ! -f "$HOME/.tmux.conf" \) -o \( "$(grep -i '044991c8a912ff3c9b0de5652ffd7efd59a96836c03d7484064267f117bfd6e9' ~/.tmux.conf | wc -l)" = "0" \) ]; then
    cat "$SETUP_ROOT/config/tpm.conf" >> "$HOME/.tmux.conf";
fi
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
bash ~/.tmux/plugins/tpm/bin/install_plugins
echo "Installed Tmux Plugin Manager"
