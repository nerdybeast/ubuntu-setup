#!/bin/bash

set -e

export NVS_HOME="$HOME/.nvs"

if [ -d "$NVS_HOME" ]; then
	echo "NVS already installed, updating..."
	git -C "$NVS_HOME" fetch --all --prune > /dev/null
	git -C "$NVS_HOME" reset --hard > /dev/null
	git -C "$NVS_HOME" pull > /dev/null
else
	echo "Installing NVS (Node Version Switcher)..."
	rm -rf "$NVS_HOME"
	git clone https://github.com/jasongin/nvs "$NVS_HOME" > /dev/null
fi

echo "Running NVS install..."
. $NVS_HOME/nvs.sh install > /dev/null
echo "✅ NVS installed!"
