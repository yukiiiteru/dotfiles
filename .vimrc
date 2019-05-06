" --------------------------------
"	My vimrc
"	@author: wfly1998
" --------------------------------
" Vundle.vim config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'sensible.vim'
" Plugin 'winmanager'
" Plugin 'taglist-plus'				" I use tagbar
Plugin 'VundleVim/Vundle.vim'
" Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'myusuf3/numbers.vim'
" Plugin 'davidhalter/jedi-vim'		" I want to try YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
nnoremap <F4> :NumbersToggle<CR>
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <Space>f <Plug>(easymotion-overwin-f)
" nmap <Space> <Plug>(easymotion-prefix)
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
map <F5> <Esc>:w!<CR>:call RunCode()<CR>
autocmd FileType python map <F6> <Esc>:w!<CR>:!python % 
autocmd FileType c,cpp inoremap {<CR> {<CR>}<Esc>O
map <C-c> :call CodeMode()<CR>
map <C-n>h :nohl<CR>
" map <C-l> :set scrollbind<CR>
" map <C-n>l :set noscrollbind<CR>
nmap <leader>h :set scrollbind<CR>
nmap <leader>n :set noscrollbind<CR>
" map <C-t>h <Esc>:vsplit<CR>:term<CR><C-w>j<C-w>q<C-w>N:set nu!<CR>i
map <C-t>h <Esc>:vsp<CR>:ter ++curwin<CR><C-w>N:set nu!<CR>i
" map <C-t>j :terminal<CR><C-w>N<C-w>r:set nu!<CR>i
map <C-t>j <Esc>:sp<CR><C-w>j:ter ++curwin<CR><C-w>N:set nu!<CR>i
" map <C-t>k :terminal<CR><C-w>N:set nu!<CR>i
map <C-t>k <Esc>:sp<CR>:ter ++curwin<CR><C-w>N:set nu!<CR>i
" map <C-t>l <Esc>:vsplit<CR>:term<CR><C-w>j<C-w>q<C-w>N:set nu!<CR><C-w>ri
map <C-t>l <Esc>:vsp<CR><C-w>l:ter ++curwin<CR><C-w>N:set nu!<CR>i
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
" nmap <Space>z :bp|bd#<CR>
tnoremap <C-e> <C-w>N


func CodeMode()
	" Enable colorscheme and autosave status
	" Just need quit with :qall
	" I added an alias in .zshrc to start with Session
	" as this: alias vimS="vim -S ~/.vim/session/Session.vim"
	" Type vimS to recover last status
	set sessionoptions=buffers,curdir,resize,folds,tabpages
	exec 'colorscheme darkblue'
	exec "autocmd VimLeave * mksession! $HOME/.vim/session/Session.vim"
endfunc

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


