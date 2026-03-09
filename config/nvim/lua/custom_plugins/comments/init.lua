local M = {}

function M.setup(opts)
  vim.api.nvim_create_autocmd("BufEnter", {
		callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
			local bufname = vim.api.nvim_buf_get_name(bufnr)
      print("Buffer Entered: ", bufnr, bufname)

      if not pcall(require, "nvim-treesitter") then
        print("TreeSitter not available")
        return
      end
      print("working")

      local query_string = "((comment) @comment (#match? @comment 'TODO'))"

      local parser = require("nvim-treesitter.parsers").get_parser(bufnr)
      print(parser)
      if (parser == nil) then
        return
      end

		end,
	})
	--[[
    opts should take a key called tags which should allow array of tags

    require("comments").setup({
      tags = [
        {
          "tag": "todo",
          "color": "#FF8C00",
        },
        {
          "tag": "!",
          "color": "#FF2D00",
        },
      ],
    })

    - use treesitter playground for fast lookups of comments
    - comment should only highlight one line
    - It should only work if the tag is the first word/instance of the comment
    - Should work for single line and multiline comments
    - Create a default config that people can override
    - Bonus: Make a function that comments a line and set to keymap
    - TODO: Example 1
    - TODO: Example 2

  opts = vim.tbl_deep_extend("force", {}, opts or {})

  vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
      print("is this thing working")
      -- All our logic for selecting keywords and highlighting line
      if not pcall(require, "nvim-treesitter") then
        print("TreeSitter not available")
        return
      end

      print("Working")
      -- Get the buffer of the file you are currently in
      local bufnr = vim.api.nvim_get_current_buf()

      local query_string = "((comment) @comment (#match? @comment 'TODO'))"

      local parser = require("nvim-treesitter.parsers").get_parser(bufnr)
      print(parser)
      if (parser == nil) then
        return
      end

      local query = vim.treesitter.query.parse_query(parser:lang(), query_string)
      print(query)
      if (query == nil) then
        return
      end

      local tree = parser:parse()[1]

      for _, n in query:iter_captures(tree:root(), 0) do
        local text = vim.treesitter.query.get_node_text(n, 0)
        print(text)
      end

    end,
  })
  print("comments setup")
--]]
end

function M.test_print()
	print("something")
end

return M
