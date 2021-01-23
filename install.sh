#!/bin/sh
SETUP_ROOT="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)/.setup";
sudo add-apt-repository ppa:git-core/ppa && \
sudo apt update && \
sudo apt install git && \
git clone --depth="1" --branch="master" https://github.com/sicet7/.setup.git && \
cd ".setup" && \
. run.sh && \
cd .. && \
rm -rfv .setup && \
echo "Done :-)"
