local M = {}

M.setup = function()
	vim.api.nvim_create_autocmd("WinClosed", {
		group = vim.api.nvim_create_augroup("ScratchBuffer", { clear = true }),
		callback = function(args)
			local win_id = tonumber(args.match)
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				local buf_name = vim.api.nvim_buf_get_name(buf)
				if buf_name:match("*scratch*") then
					local bufnr = vim.api.nvim_win_get_buf(win_id)
					vim.api.nvim_buf_delete(bufnr, { force = true })
					break
				end
			end
		end,
	})
end

M.run_buffer = function()
  print("buffer ran")
end

M.open_buffer = function()
	local buf = vim.api.nvim_create_buf(true, true)
	local win_height = vim.api.nvim_win_get_height(0)
	local buf_win_height = math.floor(win_height / 2)
	vim.cmd("topleft " .. buf_win_height .. "split")

	vim.api.nvim_buf_set_name(buf, "*scratch*")
	vim.api.nvim_set_option_value("filetype", "lua", { buf = buf })
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, { "-- Welcome to Neovim!", "" })
  vim.api.nvim_buf_set_keymap(buf, "n", "<leader>w", ":lua require('custom_plugins.scratch').run_buffer()<CR>", { noremap = true, silent = true })

	vim.api.nvim_win_set_buf(0, buf)

	vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
end

return M
