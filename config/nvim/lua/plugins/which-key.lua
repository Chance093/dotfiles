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

		-- Add group labels and icons for better organization
		wk.add({
			{ "<leader>f", group = "Find", icon = { icon = "󰈞 ", color = "blue" } },
			{ "<leader>g", group = "Git", icon = { icon = "󰊢 ", color = "orange" } },
			{ "<leader>h", group = "Harpoon", icon = { icon = "󰀱 ", color = "cyan" } },
			{ "<leader>x", group = "Diagnostics", icon = { icon = "󱖫 ", color = "red" } },
			{ "<leader>c", group = "Code", icon = { icon = "󰅩 ", color = "purple" } },
			{ "<leader>o", group = "OpenCode", icon = { icon = "󰧑 ", color = "azure" } },
			{ "<leader>-", icon = { icon = "󰉋 ", color = "yellow" } },
			{ "<leader>s", icon = { icon = "󰛔 ", color = "cyan" } },
			{ "<leader>y", icon = { icon = "󰅇 ", color = "green" } },
			{ "<leader>Y", icon = { icon = "󰅇 ", color = "green" } },
		})
	end,
}
