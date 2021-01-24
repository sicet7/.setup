#!/bin/sh
EXEC_PATH="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)";
SETUP_ROOT="$EXEC_PATH/.setup";
sudo add-apt-repository ppa:git-core/ppa && \
sudo apt update && \
sudo apt install git && \
git clone --depth="1" --branch="docker" https://github.com/sicet7/.setup.git $SETUP_ROOT && \
. "$SETUP_ROOT/run.sh" && \
rm -rfv "$SETUP_ROOT" && \
echo "Done :-)"
