# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/vault"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "notes"; then

  # Window 1: notes - main nvim window
  new_window "notes"

  # Window 2: scratchpad - nvim with scratchpad.md open
  new_window "scratchpad"

  # Configure notes window - open nvim normally
  select_window "notes"
  run_cmd "nvim"

  # Configure scratchpad window - open nvim with scratchpad.md
  select_window "scratchpad"
  run_cmd "nvim inbox/scratchpad.md"

  # Set initial focus to notes window
  select_window "notes"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
