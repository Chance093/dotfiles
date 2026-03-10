return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
      })

      vim.lsp.config("bashls", {
        filetypes = { "sh" },
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "gopls", "bashls" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
          vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
          vim.keymap.set("n", "<leader>xn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
          vim.keymap.set("n", "<leader>xp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        end,
      })
    end,
  },
}
