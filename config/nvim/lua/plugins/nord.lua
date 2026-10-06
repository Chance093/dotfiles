return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_contrast = true
    require("nord").set()
    
    -- Disable LSP semantic tokens to prevent color conflicts
    -- nord.nvim doesn't support semantic tokens yet, which causes
    -- weird colors (everything turns glacier blue) when LSP loads
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
    })
  end,
}
