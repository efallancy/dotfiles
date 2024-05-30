local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Split pane navigation
keymap("n", "<C-j>", "<C-W>j")
keymap("n", "<C-k>", "<C-W>k")
keymap("n", "<C-h>", "<C-W>h")
keymap("n", "<C-l>", "<C-W>l")

