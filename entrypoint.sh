#!/bin/bash

set -e

# echo "Home: $HOME"
# exit 0

sudo apt update && sudo apt upgrade -y

mkdir -p "$HOME/projects/personal"
mkdir -p "$HOME/projects/work"

chmod +x ./setup-git.sh
./setup-git.sh

chmod +x ./setup-ssh.sh
./setup-ssh.sh

chmod +x ./setup-dotnet.sh
./setup-dotnet.sh

chmod +x ./setup-nvs.sh
./setup-nvs.sh

chmod +x ./setup-java.sh
./setup-java.sh