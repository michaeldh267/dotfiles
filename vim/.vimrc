execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <C-w>q :close<CR>
nnoremap ZZ :close<CR>
set autoindent
set backspace=indent,eol,start
set backupdir=~/.vim/backup//
set complete-=i
set directory=~/.vim/swp//
set display=lastline
set encoding=utf-8
set formatoptions=qrn1
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
set langnoremap
set laststatus=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set modelines=0
set mouse=a
set nocompatible
set nocursorcolumn
set nocursorline
set nrformats=hex
set ruler
set sessionoptions-=options
set showcmd
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set textwidth=79
set ttyfast
set undodir=~/.vim/undo//
set viminfo+=!
set wildmenu
set wrap

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if &term =~ '256color'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://sunaku.github.io/vim-256color-bce.html
	set t_ut=
	colorscheme badwolf
else
	colorscheme murphy
endif

if has("gui_running")
	colorscheme badwolf
	set guifont=Liberation\ Mono\ 12
endif

set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
set statusline+=%c    " Current column
set statusline+=-    " sep
set statusline+=%l    " Current line
set statusline+=/    " Separator
set statusline+=%L   " Total lines

if exists('g:loaded_syntastic_plugin')
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_python_checkers = ['pylint'] " or python
  let g:syntastic_cpp_checkers = ['clang_check', 'clang_tidy'] " clang_tidy, gcc
  " Syntastic statusline settings
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

" EOF
