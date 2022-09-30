#!/bin/bash

set -eufo pipefail

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "  ___      _    __ _ _          "
echo " |   \ ___| |_ / _(_) |___ ___  "
echo " | |) / _ \  _|  _| | / -_|_-<  "
echo " |___/\___/\__|_| |_|_\___/__/  "
echo -e "${NC}"
echo -e "${GREEN}🤚  This script will setup .dotfiles for you.${NC}"
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

# Detect OS
OS="$(uname -s)"
echo -e "${BLUE}🔍 Detected OS: ${OS}${NC}"

# Set up paths
HOMEBREW_DIR="${HOME}/.homebrew"
DOTFILES_REPO="https://github.com/igor012/dotfiles.git"


# Install Git
if ! command -v git >/dev/null 2>&1; then
    echo -e "${GREEN}🍺  Installing Command Line tools${NC}"
    xcode-select --install
fi

# Install Homebrew if on macOS
if [ "$OS" = "Darwin" ]; then
    if ! command -v brew >/dev/null 2>&1; then
        echo -e "${GREEN}🍺  Installing Homebrew${NC}"
        if [ -d "${HOMEBREW_DIR}" ]; then
            echo -e "${YELLOW}⚠️  ${HOMEBREW_DIR} already exists, skipping Homebrew installation${NC}"
        else
            /bin/bash -c "$(git clone https://github.com/Homebrew/brew ${HOMEBREW_DIR})"
        fi
        export PATH="${PATH}:${HOME}/.homebrew/bin"
    else
        echo -e "${BLUE}✓ Homebrew is already installed${NC}"
    fi
fi

# Install chezmoi
if ! command -v chezmoi >/dev/null 2>&1; then
    echo -e "${GREEN}👊  Installing chezmoi${NC}"
    if [ "$OS" = "Darwin" ]; then
        brew install chezmoi
    elif [ "$OS" = "Linux" ]; then
        sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
        export PATH=$PATH:$HOME/.local/bin
    else
        echo -e "${RED}❌ Unsupported OS: ${OS}${NC}"
        exit 1
    fi
else
    echo -e "${BLUE}✓ chezmoi is already installed${NC}"
fi

# Initialize chezmoi
if [ -d "${HOME}/.local/share/chezmoi/.git" ]; then
    echo -e "${YELLOW}🚸  chezmoi already initialized${NC}"
    echo -e "${YELLOW}    To reinitialize, run: 'chezmoi init ${DOTFILES_REPO}'${NC}"
else
    echo -e "${GREEN}🚀  Initializing dotfiles with:${NC}"
    echo -e "${BLUE}    chezmoi init ${DOTFILES_REPO}${NC}"
    read -n 1 -r -s -p "Press any key to continue or Ctrl+C to abort..."
    chezmoi init "${DOTFILES_REPO}"
fi

# Prompt for applying the dotfiles
echo ""
echo -e "${GREEN}🔄 Ready to apply dotfiles configuration${NC}"
read -p "Would you like to apply the dotfiles now? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}⚙️  Applying dotfiles...${NC}"
    chezmoi apply
fi

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo -e "${BLUE}Note that some changes may require a logout/restart to take effect.${NC}"
