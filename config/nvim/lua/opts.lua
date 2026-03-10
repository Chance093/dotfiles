-- Indentation settings
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 2           -- Number of spaces a tab counts for
vim.opt.softtabstop = 2       -- Number of spaces for editing operations
vim.opt.shiftwidth = 2        -- Number of spaces for autoindent
vim.opt.smartindent = true    -- Smart autoindenting on new lines

-- Cursor and line numbers
vim.opt.guicursor = ""        -- Fat cursor (comment out for thin cursor)
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Text wrapping
vim.opt.wrap = false          -- Don't wrap lines

-- Backup and undo
vim.opt.swapfile = false      -- Don't create swapfiles
vim.opt.backup = false        -- Don't create backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true       -- Persistent undo history

-- Search settings
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Incremental search
vim.opt.ignorecase = true     -- Case insensitive search
vim.opt.smartcase = true      -- Case sensitive if uppercase present

-- UI/UX improvements
vim.opt.scrolloff = 8         -- Keep 8 lines above/below cursor
vim.opt.signcolumn = "yes"    -- Always show sign column
vim.opt.updatetime = 50       -- Faster completion
vim.opt.termguicolors = true  -- True color support
vim.opt.splitright = true     -- Vertical splits go right
vim.opt.splitbelow = true     -- Horizontal splits go below

-- Other settings
vim.opt.foldcolumn = "1"      -- Show fold column
vim.opt.conceallevel = 2      -- Conceal text (useful for markdown)
