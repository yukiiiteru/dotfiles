local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Space>q", ":q<CR>", opts)
vim.keymap.set("n", "<Space>w", ":w<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", opts)
