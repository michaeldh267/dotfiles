call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/tpope/vim-sleuth'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
call plug#end()
set t_Co=256
colorscheme default
set mouse=a
set foldmethod=marker
set foldlevel=0
"  wildmenu {{{
if has("wildmenu")
	set wildignore+=*.a,*.o
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
	set wildignore+=.DS_Store,.git,.hg,.svn
	set wildignore+=*~,*.swp,*.tmp
	set wildignore+=*.pyc
	set wildmenu
	set wildmode=longest,list
endif
" }}}
" {{{ key mappings
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap j gj
nnoremap k gk
" nnoremap <silent> <F3> :YRShow<cr>
" inoremap <silent> <F3> <ESC>:YRShow<cr>
nnoremap <Space> za
vnoremap <Space> zv
" }}}
" " undo & backup dirs {{{
" if has('win32')
" 	let s:homedir = "$HOME/vimfiles"
" else
" 	let s:homedir = "$HOME/.vim"
" endif
" execute "set backupdir=" . s:homedir . "/backup"
" execute "set directory=" . s:homedir . "/directory"
" execute "set undodir=" . s:homedir . "/undo"
" if !isdirectory(expand(&backupdir))
"     call mkdir(expand(&backupdir))
" endif
" if !isdirectory(expand(&undodir))
"     call mkdir(expand(&undodir))
" endif
" if !isdirectory(expand(&directory))
"     call mkdir(expand(&directory))
" endif
" " }}}
" statusline {{{
" set statusline=%<%f\ %y%h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" }}}
" " syntastic {{{
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 3
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exec = '/usr/bin/python3'
" let g:syntastic_shell = "/bin/zsh"
" }}}
" The vimrc Graveyard! {{{
"
" F5 All the things!
" au FileType python map <F5> :!clear && python -i %<CR>
" au FileType python map <F5> :!clear; and bpython -i %<CR>
" au BufWritePost *.py silent !ctags -R .
" au FileType vim map <F5> :so ~/.vimrc<CR>
"syntax off
"set nohlsearch
"set t_md=

"inoremap jk <esc>
"inoremap <esc> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"set cursorline
"set hlsearch
"set textwidth=79
"set colorcolumn=85
"set clipboard^=unnamedplus
" nnoremap / /\v
" vnoremap / /\v
" let g:solarized_termcolors=256
" set background=light
" set magic " better regex (new)
" set path=.,**
" set spelllang=en
" set omnifunc=syntaxcomplete#Complete
" set modelines=0
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab
" set encoding=utf-8
" set showmode
" set showcmd
" set hidden
" set visualbell
" set ttyfast
" set undofile
" set ignorecase
" set smartcase
" set gdefault
" set showmatch
" set wrap
" set title
" set lazyredraw
" 
" }}}
