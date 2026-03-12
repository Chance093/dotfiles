return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "nord",
      },
      sections = {
        lualine_z = {
          {
            require("opencode").statusline,
            cond = function()
              -- Only show if opencode is available
              return pcall(require, "opencode")
            end,
          },
        },
      },
    })
  end
}
