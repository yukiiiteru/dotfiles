" --------------------------------
"	My vimrc
"	@author: wfly1998
"	@change: 20230109
" --------------------------------
" vim-plug config
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82'}
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'tjdevries/overlength.vim'
call plug#end()
" --------------------------------
" Plugin setting
let g:airline_powerline_fonts = 1
let g:vim_markdown_folding_disabled = 1

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" --------------------------------
" My config
set number
set smartindent
set tabstop=8
set shiftwidth=8
set hlsearch
set autoread
set nowrap
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
colorscheme gruvbox
" Key map
vnoremap <C-c> "+y
nnoremap <Space>q :q<CR>
nnoremap <Space>w :w<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
autocmd FileType c,cpp,rust inoremap {<CR> {<CR>}<Esc>O
" --------------------------------
