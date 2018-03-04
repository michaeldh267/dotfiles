try
execute pathogen#infect()
catch
endtry

syntax on
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR>
cnoreabbrev W w
cnoreabbrev X x
nnoremap <C-w>q :close<CR>
nnoremap ZZ :close<CR>
nnoremap / /\v
nnoremap ? ?\v
set backspace=indent,eol,start
set complete-=i
set display=lastline
set encoding=utf-8 " make sure this is the same as $LANG...OR ELSE
set formatoptions=qrn1
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
set langnoremap
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set modelines=0
set mouse=a
set nrformats=hex
set sessionoptions-=options
set tabpagemax=50
set tags=./tags;,tags
set viminfo+=!
set wildmenu

"set ruler
"set lazyredraw
set laststatus=2
"set smartindent " testing
"set smarttab
"set showcmd
"set autoindent
"set textwidth=79
"set ttyfast
set nowrap " Friends don't let friends wrap text. You've been warned.

set nobackup
set nocompatible
set nocursorcolumn
set nocursorline
set noundofile

" indent crap
" set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab

set colorcolumn=80
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" 
"set t_ut=
"if &t_Co == "256" || has("gui_running")
if has("gui_running")
  try 
    colorscheme badwolf
  catch
    colorscheme desert
  endtry
else
  try
    colorscheme badwolf
  catch
    colorscheme desert
  endtry
endif

if has("gui_running")
  set guifont=Liberation\ Mono\ 12
  set guioptions-=l
  set guioptions-=r
  set guioptions-=L
  " winpos 0 0
  " set lines=60
  " set columns=90
  set guioptions-=R
  set guioptions-=T
endif

set statusline=%f     " Path to the file
set statusline+=\ -\  " Separator
set statusline+=FT:   " Label
set statusline+=%y    " Filetype of the file
set statusline+=%c    " Current column
set statusline+=-     " sep
set statusline+=%l    " Current line
set statusline+=/     " Separatorr
set statusline+=%L    " Total lines
set statusline+=%m    " Modified?
set statusline+=%m    " Modified?
set statusline+=%m    " Modified?

" if exists('g:loaded_syntastic_plugin')
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cpp_checkers = ['clang_check', 'clang_tidy'] " clang_tidy,gcc
" " Syntastic statusline settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" endif
let g:syntastic_python_checkers = ['flake8', 'python'] " or python
"let g:syntastic_python_checkers = ['pyflakes', 'python'] " or python
let g:syntastic_python_python_exec = '/usr/bin/python3'

let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jshint']

"au BufNewfile,BufRead *.hs set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
"au BufNewfile,BufRead *.pas set tabstop=2 softtabstop=2 shiftwidth=2 smartindent
let g:paredit_mode=1
" let g:paredit_electric_return=1
" let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'
"
" rainbow parenthesis settings
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" au VimEnter * RainbowParenthesesToggle
" CtrlP root
let g:ctrlp_working_path_mode = 'c'
" EOF
