try
execute pathogen#infect()
catch
endtry

syntax on
filetype plugin indent on

" Rebindings {{{
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
map <C-n> :NERDTreeToggle<CR>

" I never mean these when I'm trying to type the other.
cnoreabbrev W w
cnoreabbrev X x

" If you want to quit you'll have to spell it out!
"cnoreabbrev x close<CR>
"cnoreabbrev q close<CR>
"cnoreabbrev wq close<CR>
"nnoremap <C-w>q :close<CR>
"nnoremap ZZ :close<CR>
nnoremap / /\v
nnoremap ? ?\v
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
" }}}

" General Settings {{{
scriptencoding utf-8
setglobal termencoding=utf-8 
set ttyfast
set backspace=indent,eol,start
"set colorcolumn=80
set complete-=i
set display=lastline
set encoding=utf-8 " make sure this is the same as $LANG...OR ELSE
set textwidth=0
set wrapmargin=0
set hidden
set history=10000
set hlsearch
set incsearch
set langnoremap
set laststatus=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set modelines=0
set mouse=a
set nrformats=hex
"set omnifunc=syntaxcomplete#Complete
set sessionoptions-=options
set tabpagemax=50
set tags=./tags;,tags
set viminfo+=!
" }}}

" Allow formatting with 'gq'
set formatoptions=q
set fo-=c
set fo-=t

" Wildmenu Completion {{{ 
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.pyc
"}}}

" Disabled settings! {{{
set nowrap " Friends don't let friends wrap text. You've been warned.
set nobackup
set nocompatible
set nocursorcolumn
set nocursorline
set noundofile
" }}}

" Random thing that fixes gnome-terminal {{{
set t_ut=
" }}}

" Folding {{{
set foldmethod=marker
set nofoldenable
" set foldlevelstart=0
" set foldnestmax=1
" }}}


" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Colorschemin {{{
if has("gui_running")
  set guifont=Liberation\ Mono\ 12
  winpos 0 0
  set lines=35
  set columns=80
  try
    colorscheme badwolf
  catch
    colorscheme murphy
  endtry
else
  try
    colorscheme badwolf
  catch
    colorscheme murphy
  endtry
endif
" }}}

"{{{ Statusline
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
"}}}

"{{{ old crud
"set ruler
"set lazyredraw
"set smartindent " testing
"set smarttab
"set showcmd
"set autoindent
"set ttyfast
"if &t_Co == "256" || has("gui_running")
" set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
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
"au BufNewfile,BufRead *.hs set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
" let g:paredit_electric_return=1
let g:slimv_swank_cmd = '! gnome-terminal -- bash -c "sbcl --load ~/.vim/slime/start-swank.lisp" &'
"let g:slimv_swank_cmd = '! xterm -e clisp -C ~/quicklisp/dists/quicklisp/software/slime-v2.21/swank &'
"/quicklisp/dists/quicklisp/software/slime-v2.21/swank
"
""rainbow parenthesis settings
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"}}}

"{{{ Python syntastic settings
 let g:syntastic_python_python_exec = '/usr/bin/python3'
 let g:syntastic_python_pyflakes_exec = '/usr/bin/pyflakes3'
 let g:syntastic_python_checkers = ['pyflakes', 'python'] " or python
"}}}
 
"{{{ Python
function! PythonOpts()
 setlocal tabstop=8 
 setlocal softtabstop=4
 setlocal shiftwidth=4
 setlocal expandtab
 setlocal foldmethod=indent
 setlocal foldnestmax=1
 setlocal omnifunc=python3complete#Complete
endfunction
autocmd FileType python call PythonOpts()
"autocmd FileType python setlocal makeprg=cat\ %
" autocmd BufWritePost *.py make
"autocmd QuickFixCmdPost * copen
"}}}

" Java {{{
function! JavaOpts()
  " Keep these two equal at all times!
  setlocal tabstop=4 " How many columns a tab counts for
  setlocal shiftwidth=4 " How many columns indent with >>,<<,cindent

  setlocal softtabstop=4 " How far TAB and BS move the cursor

  setlocal expandtab " Expand TAB presses to spaces

  setlocal autoindent
  setlocal smartindent
  set cinoptions+=j1
endfunction
autocmd FileType java call JavaOpts()
"}}}

" Haskell {{{
function! HaskellOpts()
set expandtab
set nofoldenable
endfunction
autocmd FileType haskell call HaskellOpts()
"}}}

" Misc {{{
" let g:syntastic_perl_checkers = ['perl']
" let g:syntastic_enable_perl_checker = 1

" Javascript checker gunk
let g:syntastic_javascript_checkers = ['eslint']

" lua checker
let g:syntastic_lua_checkers = ["luacheck"]

let g:paredit_mode=1
" CtrlP root
let g:ctrlp_working_path_mode = 'c'

" set filetype for SlackBuild info files
autocmd BufEnter,BufNew *.SlackBuild setlocal ft=sh
autocmd BufEnter,BufNew *.info call CheckSlackBuildInfo()
function! CheckSlackBuildInfo()
    if filereadable(expand('%:p:r'). '.SlackBuild')
        setlocal filetype=sh
    endif
endfunction
"}}}

