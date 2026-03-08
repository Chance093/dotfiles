#!/usr/bin/env bash

install_linux() {
  echo "You are in linux"
}

install_macos() {
  # install homebrew
  if [[ "$(brew --version)" == *"command not found"* ]]; then 
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # install packages in brew and brew cask files

  # Create symlinks
}

# detect OS
case $(uname -s) in 
  Linux) install_linux;;
  Darwin) install_macos;;
  *) echo "Don't know what this is";;
esac

# Install package managers depending on OS
# Install packages based on appropriate files
# Install zsh and set as default shell (possibly)
# Create symlinks for all configs
# Open nvim headlessly so lazy.nvim installs all plugins
# Copy secrets.example.sh => secrets.sh if it doesn't exist
# Print a summary of what has been done
