return {
	"j-hui/fidget.nvim",
	opts = {
		-- Options for LSP progress display
		progress = {
			display = {
				done_icon = "✔", -- Icon when LSP tasks complete
				progress_icon = { "dots" }, -- Spinner animation for progress
			},
		},
		-- Options for notification display
		notification = {
			window = {
				winblend = 0, -- Make window opaque for Nord theme compatibility
			},
		},
	},
}
