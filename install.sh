#!/bin/sh
EXEC_PATH="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)";
SETUP_ROOT="$EXEC_PATH/.setup";

if [ -d "$SETUP_ROOT" ]; then
    rm -rf "$SETUP_ROOT"
fi

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git
git clone --depth="1" --branch="develop" https://github.com/sicet7/.setup.git $SETUP_ROOT
. "$SETUP_ROOT/run.sh"
rm -rfv "$SETUP_ROOT"
echo "Done :-)"
