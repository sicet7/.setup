#!/bin/sh

sudo apt update

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

installIfMissing()
{
    PACKAGE=$1
    COMMAND=$2
    which=$(which "$COMMAND");
    if [ ${#which} -lt 1 ]; then
        sudo apt install "$PACKAGE" -y
    fi
}

linkDotFile()
{
    INPUT=$1
    OUTPUT=$2
    if [ ! -f "$INPUT" ] && [ ! -d "$INPUT" ]; then
        echo "Input not found: $INPUT"
        exit 1;
    fi
    if [ -L "$INPUT" ]; then
        echo "Input cannot be a symlink!"
        exit 1;
    fi
    if [ -f "$OUTPUT" ] || [ -d "$OUTPUT" ]; then
        if [ -L "$OUTPUT" ]; then
            rm -v "$OUTPUT"
        else
            mv -v "$OUTPUT" "$OUTPUT.bak"
        fi
    fi
    OUTPUT_DIR=$(dirname "$OUTPUT");
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    ln -s "$INPUT" "$OUTPUT" && echo "linked: $OUTPUT -> $INPUT"
}

#Install Dependencies from apt
installIfMissing "git" "git"
installIfMissing "fish" "fish"
installIfMissing "ranger" "ranger"
installIfMissing "tmux" "tmux"
installIfMissing "bash" "bash"
installIfMissing "wget" "wget"

#Download TPM
TPM_DIR="$SCRIPT_PATH/tmux/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
    rm -rf "$TPM_DIR" && echo "removed: '$TPM_DIR'"
fi
git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"

#Download Fisher
FISHER_FILE="$SCRIPT_PATH/fish/functions/fisher.fish"
if [ ! -d $(dirname "$FISHER_FILE") ]; then
    mkdir -p $(dirname "$FISHER_FILE")
fi
if [ -f "$FISHER_FILE" ]; then
    rm -fv "$FISHER_FILE"
fi
wget https://git.io/fisher --output-document="$FISHER_FILE"

#Download Composer
COMPOSER_FILE="$SCRIPT_PATH/composer.phar"
if [ ! -d $(dirname "$COMPOSER_FILE") ]; then
    mkdir -p $(dirname "$COMPOSER_FILE")
fi
if [ -f "$COMPOSER_FILE" ]; then
    rm -vf "$COMPOSER_FILE"
fi
wget https://getcomposer.org/composer-stable.phar --output-document="$COMPOSER_FILE"

#Composer
linkDotFile "$COMPOSER_FILE" "$HOME/.local/bin/composer"

#Git Config
linkDotFile "$SCRIPT_PATH/git/.gitconfig" "$HOME/.gitconfig"

#TMUX Setup
linkDotFile "$SCRIPT_PATH/tmux/.tmux.conf" "$HOME/.tmux.conf"
linkDotFile "$SCRIPT_PATH/tmux/.tmux" "$HOME/.tmux"

#FISH Setup
linkDotFile "$SCRIPT_PATH/fish/config.fish" "$HOME/.config/fish/config.fish"
linkDotFile "$SCRIPT_PATH/fish/aliases.fish" "$HOME/.config/fish/aliases.fish"
linkDotFile "$FISHER_FILE" "$HOME/.config/fish/functions/fisher.fish"

#Run TPM plugin installer
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
bash ~/.tmux/plugins/tpm/bin/install_plugins

#Run Fisher Plugin installer
fish -c fisher
