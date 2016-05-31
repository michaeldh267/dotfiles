execute pathogen#infect()
syntax on
filetype plugin indent on
" Depends: vim-sensibile, badwolf, syntastic
set background=dark
colorscheme badwolf

set path=.,**
set spelllang=en
set omnifunc=syntaxcomplete#Complete
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch
set wrap
set textwidth=79
set colorcolumn=85
set title
set mouse=a

nnoremap / /\v
vnoremap / /\v
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildignore+=*.pyc
    set wildmenu
    set wildmode=longest,list
endif

if has('win32')
	let s:homedir = "$HOME/vimfiles"
else
	let s:homedir = "$HOME/.vim"
endif
execute "set backupdir=" . s:homedir . "/backup"
execute "set directory=" . s:homedir . "/directory"
execute "set undodir=" . s:homedir . "/undo"
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir))
endif
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir))
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory))
endif

set statusline=%<%f\ %y%h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_shell = "/bin/zsh"

" F5 All the things!
" au FileType python map <F5> :!clear && python -i %<CR>
" au FileType python map <F5> :!clear; and bpython -i %<CR>
" au BufWritePost *.py silent !ctags -R .
" au FileType vim map <F5> :so ~/.vimrc<CR>

au FocusLost * :wa " Gvim: save if focus lost

au FileType html map <F5> :!iceweasel %<CR><CR>
