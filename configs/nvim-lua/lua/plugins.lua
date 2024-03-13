-- lazy.nvim installer
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- basic configs
	'tpope/vim-sensible',
	-- colorscheme
	{
		'morhetz/gruvbox',
		config = function() vim.cmd 'colorscheme gruvbox' end,
	},
	-- overlength highlight
	'tjdevries/overlength.vim',
	-- thrift highlight
	{ 'solarnz/thrift.vim', ft = { 'thrift' } },
	-- rust highlight
	{ 'rust-lang/rust.vim', ft = { 'rust' } },
	-- rust crates version checker
	{
		'Saecki/crates.nvim',
		tag = 'stable',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = 'BufEnter Cargo.toml',
		config = function() require('crates').setup() end,
	},
	-- pretty bottom bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				options = { theme = 'gruvbox' }
			})
		end,
	},
	-- file explorer
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('nvim-tree').setup() end,
	},
	-- symbols nav
	{
		'stevearc/aerial.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('aerial').setup({
				layout = {
					min_width = 20,
					max_width = { 40, 0.2 },
				},
			})
		end,
	},
	-- floating terminal
	'numtostr/FTerm.nvim',
	-- GitHub Copilot
	'github/copilot.vim',
	-- lsp support
	'neovim/nvim-lspconfig',
	-- autocomplete
	'hrsh7th/nvim-cmp',
	-- autocomplete with lsp
	'hrsh7th/cmp-nvim-lsp',
	-- autocomplete from buffer (for `/` and `?`)
	'hrsh7th/cmp-buffer',
	-- autocomplete cmdline (for `:`)
	'hrsh7th/cmp-cmdline',
	-- LuaSnip
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip',
	-- fuzzy file finder
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
})

-- aerial.nvim
vim.keymap.set('n', '<C-a>', '<cmd>AerialToggle!<CR>')

-- nvim-tree.lua
vim.keymap.set('n', '<C-e>', '<cmd>NvimTreeToggle<CR>')

-- FTerm.nvim
vim.keymap.set('n', '<C-t>', require('FTerm').open, {})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-y>', builtin.buffers, {})
