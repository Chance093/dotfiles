# dotfiles

This is my complete dev environment setup for macOS. Here's what to do when setting up a fresh machine.

## Quick Setup

```bash
git clone https://github.com/Chance093/dotfiles.git
cd dotfiles
./install.sh
```

That's it! The install script will handle everything.

## What Gets Installed

The script will automatically:

1. **Install Homebrew** (if not already installed)
2. **Install all packages** from `packages/brew.txt`:
   - Neovim (your editor)
   - Tmux (terminal multiplexer)
   - Oh My Posh (prompt theme)
   - Node, Python, Go (dev runtimes)
   - ripgrep, lsd, tree-sitter (CLI tools)
   - And more...

3. **Create symlinks** for:
   - Neovim config → `~/.config/nvim`
   - Tmux config → `~/.tmux.conf`
   - Ghostty config → `~/Library/Application Support/com.mitchellh.ghostty/config`
   - Oh My Posh theme → `~/.config/ohmyposh.theme.json`
   - Zsh configs → `~/.zshrc`, `~/.alias.zsh`, `~/.export.zsh`
   - Custom scripts → `~/.local/bin/devlogs`

4. **Bootstrap Neovim** with all plugins automatically

## Requirements

- macOS (the script checks for this)
- Must run from within the dotfiles directory

## Repo Structure

```
dotfiles/
├── config/          # App configurations
│   ├── nvim/        # Neovim setup with Lazy plugin manager
│   ├── tmux/        # Tmux configuration
│   ├── ghostty/     # Ghostty terminal config
│   └── ohmyposh/    # Prompt theme
├── packages/        # Package lists
│   └── brew.txt     # Homebrew packages to install
├── scripts/         # Custom scripts
│   └── devlogs      # Development logging utility
├── zsh/             # Zsh shell configs
└── install.sh       # Main installation script
```

## Notes

- The install script is idempotent - you can run it multiple times safely
- Symlinks will be overwritten if they already exist
- Make sure to restart your terminal after installation to pick up all changes

## Future Plans

Here's what I am planning to add:

### Multi-OS Support

- Enhance `install.sh` to detect OS automatically (macOS, Debian-based, Arch)
- Create `install_debian()` function for Ubuntu/Debian systems using apt
- Create `install_arch()` function for Arch Linux using pacman
- Add corresponding package files:
  - `packages/apt.txt` for Debian-based distros
  - `packages/pacman.txt` for Arch-based distros
- Adjust symlink paths for Linux (e.g., Ghostty config location differences)

### Secrets Management

- Create `zsh/secrets.example.sh` to document what secrets are needed
- Update `.gitignore` to exclude actual secrets files
- Add secrets setup step to installation process
