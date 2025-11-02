#!/bin/bash

set -e

ssh_directory="$HOME/.ssh"

# Create .ssh directory if it doesn't exist
mkdir -p $ssh_directory
chmod 700 $ssh_directory

# Generate Ed25519 SSH key
if [ -f "$ssh_directory/id_ed25519" ]; then
    echo "Ed25519 SSH key already exists, skipping..."
else
    echo "Generating Ed25519 SSH key..."
    ssh-keygen -t ed25519 -f "$ssh_directory/id_ed25519" -N "" -C "$(whoami)@$(hostname)-ed25519"
    chmod 600 "$ssh_directory/id_ed25519"
    chmod 644 "$ssh_directory/id_ed25519.pub"
fi

# Generate RSA SSH key (4096 bits for better security)
if [ -f "$ssh_directory/id_rsa" ]; then
    echo "RSA SSH key already exists, skipping..."
else
    echo "Generating RSA SSH key..."
    ssh-keygen -t rsa -b 4096 -f "$ssh_directory/id_rsa" -N "" -C "$(whoami)@$(hostname)-rsa"
    chmod 600 "$ssh_directory/id_rsa"
    chmod 644 "$ssh_directory/id_rsa.pub"
fi

echo "✅ SSH keys generated successfully!"
