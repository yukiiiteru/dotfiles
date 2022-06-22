local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<Space>q", ":q<CR>", opts)
keymap("n", "<Space>w", ":w<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("i", "{<CR>", "{<CR>}<Esc>O", opts)
