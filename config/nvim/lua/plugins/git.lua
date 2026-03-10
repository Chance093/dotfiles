return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame" })
			vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git diff" })
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
			vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
			vim.keymap.set("n", "<leader>gB", ":Git blame<CR>", { desc = "Git blame file" })
		end,
	},
}
