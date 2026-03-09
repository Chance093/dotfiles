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
  if ! command -v brew &>/dev/null; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # install packages in brew.txt
  if [[ -f "$BREW_PACKAGE_FILE" ]]; then
    while IFS= read -r line <&3; do
      [[ -z "$line" || "$line" == \#* ]] && continue # skip blank lines and commented lines
      brew install "$line"
    done 3<"$BREW_PACKAGE_FILE"
  else
    echo "Error: Input file '$BREW_PACKAGE_FILE' not found." >&2
    exit 1
  fi

  # Create symlinks
  local symlinks=(
    "$(pwd)/config/nvim:$HOME/.config/nvim"
    "$(pwd)/config/tmux/.tmux.conf:$HOME/.tmux.conf"
    "$(pwd)/config/ghostty/config:$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    "$(pwd)/config/ohmyposh/ohmyposh.theme.json:$HOME/.config/ohmyposh.theme.json"
    "$(pwd)/zsh/.zshrc:$HOME/.zshrc"
    "$(pwd)/zsh/.alias.zsh:$HOME/.alias.zsh"
    "$(pwd)/zsh/.export.zsh:$HOME/.export.zsh"
  )

  for entry in "${symlinks[@]}"; do
    local src="${entry%%:*}"
    local dest="${entry##*:}"
    ln -sf "$src" "$dest"
    echo "Symlinked $dest -> $src"
  done

  # Bootstrap Neovim plugins
  nvim --headless "+Lazy! sync" +qa

  # Success
  echo ""
  echo "Done! All packages installed, symlinks created, and Neovim initialized."
}

# check if we are running script in dotfiles repo
CURRENT_DIR_NAME=$(basename "$PWD")
if [[ "$CURRENT_DIR_NAME" != "$DOTFILES_REPO" ]]; then
  echo "Error: Must run script from dotfiles repo" >&2
  exit 1
fi

install_macos
