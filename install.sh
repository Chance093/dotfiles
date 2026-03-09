#!/usr/bin/env bash

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
    done 3< "$BREW_PACKAGE_FILE"
  else
    echo "Error: Input file '$BREW_PACKAGE_FILE' not found." >&2
    exit 1
  fi

  # Create symlinks
  # Open nvim headlessly so lazy.nvim installs all plugins
  # Copy secrets.example.sh => secrets.sh if it doesn't exist
  # Print a summary of what has been done
}

install_macos
