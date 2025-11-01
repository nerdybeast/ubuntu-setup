#!/bin/bash

set -e

export NVS_HOME="$HOME/.nvs"

if [ -d "$NVS_HOME" ]; then
	git -C "$NVS_HOME" fetch --all --prune
	git -C "$NVS_HOME" reset --hard
	git -C "$NVS_HOME" pull
else
	rm -rf "$NVS_HOME"
	git clone https://github.com/jasongin/nvs "$NVS_HOME"
fi

source "$NVS_HOME/nvs.sh" install
source $HOME/.bashrc
