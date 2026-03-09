#!/usr/bin/env bash

DOTFILES_REPO="dotfiles"
BREW_PACKAGE_FILE="packages/brew.txt"

install_macos() {
  # check for OS
  if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "Error: Must be on macOS to run this script." >&2
    exit 1
  fi

  # install homebrew
  if [[ "$(brew --version)" == *"command not found"* ]]; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # install packages in brew.txt
  if [[ -f "$BREW_PACKAGE_FILE" ]]; then
    while IFS= read -r line <&3; do
      brew install "$line"
    done 3<"$BREW_PACKAGE_FILE"
  else
    echo "Error: Input file '$BREW_PACKAGE_FILE' not found." >&2
    exit 1
  fi

  # Create symlinks
  ln -sf config/nvim ~/.config/nvim
  ln -sf config/tmux/.tmux.conf ~/.tmux.conf
  ln -sf config/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
  ln -sf config/ohmyposh/ohmyposh.theme.json ~/.config/ohmyposh.theme.json

  # Open nvim headlessly so lazy.nvim installs all plugins
  # Copy secrets.example.sh => secrets.sh if it doesn't exist
  # Print a summary of what has been done
}

# check if we are running script in dotfiles repo
CURRENT_DIR_NAME=$(basename "$PWD")
if [[ "$CURRENT_DIR_NAME" != "$DOTFILES_REPO" ]]; then
  echo "Error: Must run script from dotfiles repo" >&2
  exit 1
fi

install_macos
