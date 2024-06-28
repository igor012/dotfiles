#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

HOMEBREW_DIR="${HOME}/.homebrew"

# Install Homebrew
command -v brew >/dev/null 2>&1 ||
    (echo '🍺  Installing Homebrew' && /bin/bash -c "$(git clone https://github.com/Homebrew/brew ${HOMEBREW_DIR}")

export PATH=${PATH}:${HOME}/.homebrew/bin

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 ||
    (echo '👊  Installing chezmoi' && brew install chezmoi)

if [ -d "${HOME}/.local/share/chezmoi/.git" ]; then
    echo "🚸  chezmoi already initialized"
    echo "    Reinitialize with: 'chezmoi init https://github.com/igor012/dotfiles.git'"
else
    echo "🚀  Initialize dotfiles with:"
    echo "    chezmoi init https://github.com/igor012/dotfiles.git"
fi

echo ""
echo "Done. Note that some of these changes require a logout/restart to take effect."
