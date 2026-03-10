# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/github.com/Chance093/imagesbygigi"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "imagesbygigi"; then

  # Window 1: nvim
  new_window "nvim"

  # Window 2: terminal (will be split vertically into 2 panes)
  new_window "terminal"

  # Configure nvim window
  select_window "nvim"
  run_cmd "nvim"

  # Configure terminal window with horizontal split
  select_window "terminal"
  split_h 50  # Split horizontally, 50% each pane

  # Set initial focus to nvim window
  select_window "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
