return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find marks" })
			vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Search in buffer" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
			vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "Command history" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
			vim.keymap.set("n", "<leader>fr", ":Telescope frecency<CR>", { desc = "Frequent files" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
