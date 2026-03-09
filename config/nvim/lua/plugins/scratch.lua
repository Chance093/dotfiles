return {
  dir = "~/.config/nvim/lua/custom_plugins/scratch",
  config = function()
    local scratch = require("custom_plugins.scratch")

    scratch.setup()

    vim.keymap.set('n', '<leader>5', scratch.open_buffer, {})
  end
}
