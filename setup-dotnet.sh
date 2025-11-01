#!/bin/bash

set -e

echo ""
echo "⚠ Installing .NET SDK..."
mkdir -p $HOME/Downloads
curl -fsSL https://dot.net/v1/dotnet-install.sh -o $HOME/Downloads/dotnet-install.sh
chmod +x $HOME/Downloads/dotnet-install.sh
"$HOME"/Downloads/dotnet-install.sh --channel 6.0
"$HOME"/Downloads/dotnet-install.sh --channel 8.0
"$HOME"/Downloads/dotnet-install.sh --channel 10.0

# Configure .bashrc for DOTNET_ROOT and PATH
BASHRC="$HOME/.bashrc"

# Add DOTNET_ROOT if not already set
if ! grep -q "DOTNET_ROOT=" "$BASHRC"; then
    echo "" >> "$BASHRC"
    echo "# .NET Core SDK" >> "$BASHRC"
    echo "export DOTNET_ROOT=\"\$HOME/.dotnet\"" >> "$BASHRC"
fi

# Add DOTNET_ROOT to PATH if not already present
if ! grep -q "\$PATH:\$DOTNET_ROOT" "$BASHRC"; then
    echo "export PATH=\$PATH:\$DOTNET_ROOT/bin:\$DOTNET_ROOT/tools" >> "$BASHRC"
fi

source $HOME/.bashrc

echo "✅ .bashrc configured for .NET SDK"
echo "✅ .NET SDK has been successfully installed!"
