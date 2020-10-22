#!/bin/sh
installIfMissing()
{
    PACKAGE=$1
    COMMAND=$2
    which=$(which "$COMMAND");
    if [ ${#which} -lt 1 ]; then
        sudo apt install "$PACKAGE" -y
    fi
}
