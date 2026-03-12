return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enhanced input for better OpenCode prompts
    input = {
      enabled = true,
    },
    -- Enhanced picker for OpenCode action selection
    picker = {
      enabled = true,
      actions = {
        -- Custom action to send picker items to OpenCode
        opencode_send = function(...)
          return require("opencode").snacks_picker_send(...)
        end,
      },
      win = {
        input = {
          keys = {
            -- Alt+a to send selected item to OpenCode from picker
            ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
          },
        },
      },
    },
  },
}
