-- Neovim 0.12 compatibility
-- Using nvim-treesitter 'main' branch (NOT 'master' which is archived)
-- The 'main' branch has a different API - it doesn't auto-enable highlighting
-- We need to manually enable treesitter for each filetype

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			-- Enable treesitter highlighting for all filetypes
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
					if not lang then
						return
					end
					
					-- Check if parser exists and start treesitter
					local ok, parser = pcall(vim.treesitter.get_parser, ev.buf, lang)
					if ok and parser then
						vim.treesitter.start(ev.buf)
					end
				end,
			})
		end,
	},
}
