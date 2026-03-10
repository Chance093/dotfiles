return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame" })
			vim.cmd("highlight SignColumn guibg=NONE")
			vim.cmd("highlight GitSignsAdd guibg=NONE")
			vim.cmd("highlight GitSignsChange guibg=NONE")
			vim.cmd("highlight GitSignsDelete guibg=NONE")
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git add all" })
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
		end,
	},
}
