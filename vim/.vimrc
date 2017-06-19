execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme badwolf

nnoremap <C-w>q :close<CR>
nnoremap ZZ :close<CR>
set autoindent
set backspace=indent,eol,start
set complete-=i
set display=lastline
set encoding=utf-8
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
set nrformats=hex
set ruler
set sessionoptions-=options
set showcmd
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set viminfo+=!
set wildmenu

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set t_Co=256
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://sunaku.github.io/vim-256color-bce.html
  set t_ut=
endif

set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
set statusline+=%l    " Current line
set statusline+=/    " Separator
set statusline+=%L   " Total lines


if exists('g:loaded_syntastic_plugin')
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  " Syntastic statusline settings
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

func! LoadCAbbrevs()
  iabbr do do {<CR>} while ();<C-O>3h<C-O>
  iabbr for for (;;) {<CR>}<C-O>k<C-O>3l<C-O>
  iabbr switch switch () {<CR>}<C-O>k<C-O>6l<C-O>
  iabbr while while () {<CR>}<C-O>k<C-O>5l<C-O>
  iabbr if if () {<CR>}<C-O>k<C-O>2l<C-O>
  iabbr #d #define
  iabbr #i #include
endfunc
au FileType c,cpp call LoadCAbbrevs()

func! LoadPyAbbrevs()
  iabbr def def ():<C-O>3h<C-O>
  iabbr class class (object):<C-O>9h<C-O>
endfunc
au FileType python call LoadPyAbbrevs()

au FileType php setlocal sw=2 sts=2 ai
echom "hi"
