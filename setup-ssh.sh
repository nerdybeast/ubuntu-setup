#!/bin/bash

set -e

# Create .ssh directory if it doesn't exist
mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

# Generate Ed25519 SSH key
if [ -f "$HOME/.ssh/id_ed25519" ]; then
    echo "Ed25519 SSH key already exists, skipping..."
else
    echo "Generating Ed25519 SSH key..."
    ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519 -N "" -C "$(whoami)@$(hostname)-ed25519"
    chmod 600 $HOME/.ssh/id_ed25519
    chmod 644 $HOME/.ssh/id_ed25519.pub
fi

# Generate RSA SSH key (4096 bits for better security)
if [ -f "$HOME/.ssh/id_rsa" ]; then
    echo "RSA SSH key already exists, skipping..."
else
    echo "Generating RSA SSH key..."
    ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa -N "" -C "$(whoami)@$(hostname)-rsa"
    chmod 600 $HOME/.ssh/id_rsa
    chmod 644 $HOME/.ssh/id_rsa.pub
fi

echo ""
echo "SSH keys generated successfully!"
echo ""
echo "Ed25519 public key:"
cat $HOME/.ssh/id_ed25519.pub
echo ""
echo "RSA public key:"
cat $HOME/.ssh/id_rsa.pub
echo ""
echo "Keys are located in $HOME/.ssh/"
