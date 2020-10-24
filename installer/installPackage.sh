#!/bin/sh

installPackage()
{
    if [ "$CURRENT_OS" = "Ubuntu" ]; then
        sudo apt install -y "$1"
    fi
    #if [ "$CURRENT_OS" = "Darwin" ]; then
        #TODO: Brew install.
    #fi
}
