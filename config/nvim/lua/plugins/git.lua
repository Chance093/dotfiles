return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
			vim.cmd("highlight SignColumn guibg=NONE")
			vim.cmd("highlight GitSignsAdd guibg=NONE")
			vim.cmd("highlight GitSignsChange guibg=NONE")
			vim.cmd("highlight GitSignsDelete guibg=NONE")
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
		end,
	},
}
