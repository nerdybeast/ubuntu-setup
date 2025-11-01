#!/bin/bash

set -e

# Check if git is installed
if ! command -v git &> /dev/null
then
	echo "⚠ Git is not installed. Installing git..."
	sudo apt install -y git
	echo "✅ Git has been successfully installed!"
else
	echo "✅ Git is already installed: $(git --version)"
fi

echo "⚙ Configuring Git global settings..."

global_git_config_file="$HOME/.gitconfig"
echo "Creating global git config: $global_git_config_file"
touch $global_git_config_file

git config --file $global_git_config_file user.name "Michael Penrod"
git config --file $global_git_config_file user.email "therealnerdybeast@gmail.com"
git config --file $global_git_config_file core.autocrlf false

work_git_config_file="$HOME/projects/work/.gitconfig"
echo "Creating work git config: $work_git_config_file"
touch $work_git_config_file

# Configure conditional includes for work directory
# Note: includeIf requires .path suffix and gitdir paths must end with /
git config --file $global_git_config_file includeIf.gitdir:~/projects/work/.path $work_git_config_file

# TODO: Need to update with work email
git config --file $work_git_config_file user.email "your.email@company.com"

echo ""
echo "✅ Git has been successfully configured!"
