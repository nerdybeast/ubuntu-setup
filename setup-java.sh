#!/bin/bash

set -e

sudo apt install -y openjdk-21-jdk

# Set JAVA_HOME
JAVA_HOME=$(readlink -f $(which java) | sed "s:/bin/java::")

# Add to .bashrc if not already present
if ! grep -q "export JAVA_HOME=" "$HOME/.bashrc"; then
	echo "" >> "$HOME/.bashrc"
	echo "# Java environment" >> "$HOME/.bashrc"
	echo "export JAVA_HOME=\"$JAVA_HOME\"" >> "$HOME/.bashrc"
fi

if ! grep -q "\$PATH:\$JAVA_HOME/bin" "$HOME/.bashrc"; then
	echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> "$HOME/.bashrc"
fi

echo "JAVA_HOME is set to: $JAVA_HOME"