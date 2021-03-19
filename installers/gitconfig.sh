#!/bin/sh
echo "Starting gitconfig setup."
read -p"Please enter name: " name </dev/tty
read -p"Please enter email: " email </dev/tty
echo "[user]" > "$HOME/.gitconfig"
echo "    email = $email" >> "$HOME/.gitconfig"
echo "    name = $name" >> "$HOME/.gitconfig"
cat "$SETUP_ROOT/config/gitconfig" >> "$HOME/.gitconfig"
echo "Finished setting up .gitconfig"
