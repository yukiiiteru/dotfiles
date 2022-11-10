-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'
  use 'morhetz/gruvbox'
  use 'numToStr/FTerm.nvim'
  use 'tjdevries/overlength.vim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }
end)

require('lualine').setup {
  options = { theme = 'gruvbox' }
}
