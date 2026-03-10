return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Minimal configuration - just show the popup with available keys
		preset = "classic",
		delay = 500, -- Delay in ms before showing the popup
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Add group labels for better organization
		wk.add({
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>x", group = "Diagnostics" },
			{ "<leader>c", group = "Code" },
		})
	end,
}
