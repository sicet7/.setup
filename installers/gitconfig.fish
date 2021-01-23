#!/usr/bin/env fish
if count $argv > /dev/null
    echo "Starting gitconfig setup."
    read -l -P"Please enter name: " name < /dev/tty
    read -l -P"Please enter email: " email < /dev/tty
    echo "[user]" > "$HOME/.gitconfig"
    echo "    email = $email" >> "$HOME/.gitconfig"
    echo "    name = $name" >> "$HOME/.gitconfig"
    cat "$argv[1]/config/gitconfig" >> "$HOME/.gitconfig"
    echo "Finished setting up .gitconfig"
else
    echo "gitconfig setup failed, missing arguments"
    exit 1
end
