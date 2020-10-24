#!/bin/sh

if ! hasCommand nano; then
    installPackage "nano"
fi

if ! hasCommand wget; then
    installPackage "wget"
fi

if ! hasCommand git; then
    installPackage "git"
fi

if ! hasCommand rm; then
    echo 'Missing command "rm".';
    exit 1;
fi

NANO_SYNTAX_DIR="$SP/src/syntax"

if [ -d "$NANO_SYNTAX_DIR" ]; then
    rm -rf "$NANO_SYNTAX_DIR"
fi

git clone -c core.symlinks=true https://github.com/scopatz/nanorc.git "$NANO_SYNTAX_DIR"

linkDotFile "$SP/src/.nanorc" "$HOME/.nanorc"

echo "include $NANO_SYNTAX_DIR/*.nanorc" >> ~/.nanorc
