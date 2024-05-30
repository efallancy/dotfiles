-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Window pane opening
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Auto-read file change outside of editor
vim.opt.autoread = true

-- Set line number
vim.opt.number = true

-- Set backup to none
vim.opt.backup = false
vim.opt.swapfile = false 

-- Space indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Disabling current mode status, allowing airline or other plugin to display
vim.opt.showmode = false

-- Search pattern
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlighting search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Show cursor position all the time
vim.opt.ruler = true

-- OSX weird behaviour using backspace
vim.opt.backspace = "indent,eol,start"

-- Term GUI colours
vim.opt.termguicolors = true

-- Allow access of system clipboard
vim.opt.clipboard = "unnamedplus"

-- Prevent text shifting when using features like Git gutter
vim.opt.signcolumn = "yes"

-- Screen render update time
vim.opt.updatetime = 1000

