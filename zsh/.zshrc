eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh.theme.json)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chance/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chance/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/chance/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chance/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.alias.zsh
source ~/.export.zsh

# Initialize tmuxifier
eval "$(tmuxifier init -)"

# Tmux launcher keybinding (Ctrl+f)
bindkey -s ^f "tmux-launcher\n"
