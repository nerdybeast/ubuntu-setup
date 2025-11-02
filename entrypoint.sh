#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! grep -q '$HOME/.bash_sources' "$HOME/.bashrc"; then
	echo "" >> "$HOME/.bashrc"
	echo "" >> "$HOME/.bashrc"
	echo '# Ubuntu Setup Script - source all .sh files in .bash_sources directory
if [ -d "$HOME/.bash_sources" ]; then
	for source_file in "$HOME/.bash_sources"/*.sh; do
		[ -f "$source_file" ] && . "$source_file"
	done
fi' >> "$HOME/.bashrc"
fi

mkdir -p "$HOME/.bash_sources"

echo "Updating and upgrading existing packages..."
sudo apt-get update > /dev/null
sudo apt-get upgrade -y > /dev/null
echo "✅ System packages updated and upgraded!"

mkdir -p "$HOME/projects/personal"
mkdir -p "$HOME/projects/work"

chmod +x "$SCRIPT_DIR/setup-git.sh"
"$SCRIPT_DIR/setup-git.sh"

chmod +x "$SCRIPT_DIR/setup-ssh.sh"
"$SCRIPT_DIR/setup-ssh.sh"

chmod +x "$SCRIPT_DIR/setup-dotnet.sh"
"$SCRIPT_DIR/setup-dotnet.sh"

chmod +x "$SCRIPT_DIR/setup-nvs.sh"
"$SCRIPT_DIR/setup-nvs.sh"

chmod +x "$SCRIPT_DIR/setup-java.sh"
"$SCRIPT_DIR/setup-java.sh"

. $HOME/.bashrc

echo "✅ Ubuntu setup complete!"