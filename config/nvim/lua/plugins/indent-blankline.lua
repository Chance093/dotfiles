return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = {
				char = "│", -- Thin vertical line for indent guides
			},
			scope = {
				enabled = true, -- Highlight current scope
				show_start = true, -- Show underline at scope start
				show_end = true, -- Show underline at scope end
			},
		})
	end,
}
