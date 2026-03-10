return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			-- Using default keywords: TODO, FIXME, HACK, WARN, PERF, NOTE, TEST
			-- Default signs and colors will work with your Nord theme
		})
		vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find todos" })
	end,
}
