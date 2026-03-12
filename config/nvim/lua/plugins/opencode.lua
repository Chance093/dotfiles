return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Server configuration for embedded terminal
      server = {
        -- Terminal will appear on the right side
        terminal = {
          position = "right",
          enter = false, -- Don't auto-enter terminal mode
        },
      },
      -- LSP integration disabled (experimental)
      lsp = {
        enabled = false,
      },
    }

    -- Required for automatic buffer reload when OpenCode edits files
    vim.o.autoread = true

    -- ============================================================
    -- KEYMAPS - All using <leader>o prefix
    -- ============================================================

    -- Core OpenCode actions
    vim.keymap.set(
      { "n", "x" },
      "<leader>oa",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      { desc = "Ask OpenCode (with @this context)" }
    )

    vim.keymap.set(
      { "n", "x" },
      "<leader>os",
      function()
        require("opencode").select()
      end,
      { desc = "Select OpenCode action" }
    )

    vim.keymap.set(
      { "n", "t" },
      "<leader>oo",
      function()
        require("opencode").toggle()
      end,
      { desc = "Toggle OpenCode terminal" }
    )

    vim.keymap.set(
      { "n", "x" },
      "<leader>op",
      function()
        require("opencode").prompt()
      end,
      { desc = "Execute OpenCode prompt from library" }
    )

    -- Operator mode for adding ranges to OpenCode
    vim.keymap.set(
      { "n", "x" },
      "<leader>or",
      function()
        return require("opencode").operator("@this ")
      end,
      { desc = "Add range to OpenCode (operator)", expr = true }
    )

    vim.keymap.set(
      "n",
      "<leader>orr",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      { desc = "Add current line to OpenCode", expr = true }
    )

    -- Scroll OpenCode messages
    vim.keymap.set(
      "n",
      "<S-C-u>",
      function()
        require("opencode").command("session.half.page.up")
      end,
      { desc = "Scroll OpenCode messages up" }
    )

    vim.keymap.set(
      "n",
      "<S-C-d>",
      function()
        require("opencode").command("session.half.page.down")
      end,
      { desc = "Scroll OpenCode messages down" }
    )
  end,
}
