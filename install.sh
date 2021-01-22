#!/bin/sh
INSTALL_ROOT="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";
sudo add-apt-repository ppa:git-core/ppa && \
sudo apt update && \
sudo apt install git && \
git clone --depth="1" --branch="master" https://github.com/sicet7/.setup.git && \
. ".setup/run.sh" && \
rm -rfv .setup && \
echo "Done :-)"
