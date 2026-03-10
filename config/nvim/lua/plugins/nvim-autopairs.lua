return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		
		npairs.setup({
			check_ts = true, -- Enable treesitter integration
			ts_config = {
				lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
				javascript = { "template_string" },
			},
			-- Auto-indent when pressing Enter between brackets
			map_cr = true,
			map_bs = true, -- Map backspace to delete pairs
		})

		-- Integration with nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
