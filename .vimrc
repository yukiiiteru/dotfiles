" --------------------------------
"	My vimrc
"	@author: wfly1998
"	@change: 20191130
" --------------------------------
"  vim-plug config
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 't9md/vim-choosewin'
Plug 'ycm-core/YouCompleteMe', {'do': 'python install.py --clang-completer'}
call plug#end()
" --------------------------------
" Plugin settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_min_num_of_chars_for_completion = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
map <F3> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap  <Space>f  <Plug>(choosewin)
" --------------------------------
" My config
set number
set smartindent
set tabstop=4
set shiftwidth=4
set hlsearch
set autoread
set nowrap
" sensible.vim is very good!
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936	" set encoding
map <F5> <Esc>:w!<CR>:call RunCode()<CR>
autocmd FileType python map <F6> <Esc>:w!<CR>:!python % 
autocmd FileType c,cpp inoremap {<CR> {<CR>}<Esc>O
autocmd BufNewFile,BufRead *.vh setfiletype verilog
vmap <C-c> "+y
map <C-n>h :nohl<CR>
nmap <Space>t :tabnew<CR>
nmap <Space>h :tabp<CR>
nmap <Space>l :tabn<CR>
nmap <Space>j :bp<CR>
nmap <Space>k :bn<CR>
nmap <Space>c :tabclose<CR>
nmap <Space>q :q<CR>
nmap <Space>w :w<CR>
nmap <Space>n <C-w><C-w>
nmap <Space>x <C-w><C-x>
nmap <Space>s :sp<CR>
nmap <Space>v :vsp<CR>
tnoremap <C-e> <C-w>N

func RunCode()
	if &filetype == 'c'
		exec 'terminal bash -c "gcc  % && ./a.out"'
	elseif &filetype == 'cpp'
		exec 'terminal bash -c "g++ % && ./a.out"'
	elseif &filetype == 'python'
		exec "terminal python %"
	elseif &filetype == 'tex'
		exec "terminal xelatex %"
	endif
endfunc

" --------------------------------

