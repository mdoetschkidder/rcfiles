" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
call pathogen#infect()
call pathogen#helptags()


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=1000    " keep 1000 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " only redraw when we need to
set clipboard=unnamed

" Powerline {{{
set rtp+=/Users/mdoetschkidder/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
" let g:Powerline_symbols = "fancy"
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_checkers=['']
" let g:syntastic_quiet_messages = { "type": "style" }
" }}}

" Folding settings {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" }}}

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    " autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

set tabstop=4
set cindent
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
colorscheme badwolf
set background=dark
set autoread

set cursorline
set number

iab binsh #!/bin/sh
" match ErrorMsg /\%>78v.\+/
" set laststatus=2
" #set statusline=%F%r%w%h%m\ [bfr:%n]\ [@%c,%l/%L]

nnoremap <silent> <F8> :TlistToggle<CR>
" Set space to open folds
nnoremap <space> za
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" highlight last inserted text
nnoremap gV `[v`]
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ack

map <F1> <Esc>
imap <F1> <Esc>
nmap <F8> :TagbarToggle<CR>
nmap <F2> :set cc=79,109<CR>
nmap <F3> :lclose<CR>:cclose<CR>
set tags=tags;/

" set makeprg=jam
" set makeprg=ant
set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
set errorformat=%f:%l:\ %m

" Backup settings {{{
set backup
set backupdir=./.backup,/tmp,.
set directory=./.backup,/tmp,.
set writebackup
" }}}

" CtrlP settings {{{
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hideen -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_by_filename = 1
let g:ackprg = 'ag --vimgrep'
set grepprg=ag\ --nogroup\ --nocolor
" }}}



"
" Python related stuff {{{
"
" Pylint is the default compiler for python files
" let g:pylint_onwrite = 0
" au FileType python compiler pylint
" au FileType python makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}"\ %:p
" au BufWritePost *.py make
" Except test files which are run using pytest.
" au! BufNewFile,BufRead test_*.py compiler unit2
" and launched using vim-makegreen
" map <leader>rt <Plug>MakeGreen
" Code quality
" Complexity evaluation thanks to GRB
" (https://github.com/garybernhardt/pycomplexity/blob/master/complexity.vim)
" map <F5> :call ShowComplexity()<cr>
" map <F6> :call Pylint(1)<cr>
let python_highlight_all = 1
let python_slow_sync = 1
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_lint_cwindow = 0
let g:pymode_options = 1
let g:pymode_options_max_line_length = 109
" Turn off pymode linting. I prefer syntastic
let g:pymode_lint = 0 
let g:pymode_lint_config = '$HOME/.pylintrc'
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_python = 'python'
let g:pymode_lint_ignore = ["E303", "E501"]
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
" }}}

set showmatch

" Display tag list
map <F7> :TlistToggle<cr>


if has("gui")
    inoremap <C-Space> <C-n>
elseif has("unix")
    inoremap <Nul> <C-n>
endif

function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" NerdCommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

set modelines=1
set completeopt=menu

" vim:foldmethod=marker:foldlevel=0
