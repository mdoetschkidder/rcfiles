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

set tabstop=4
set cindent
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
colorscheme matt
set background=dark
set autoread

set cursorline

iab binsh #!/bin/sh
iab CPEA //(C) 2011 Electronic Arts Inc
" match ErrorMsg /\%>78v.\+/
set laststatus=2
set statusline=%F%r%w%h%m\ [bfr:%n]\ [@%c,%l/%L]

nnoremap <silent> <F8> :TlistToggle<CR>
map <F1> <Esc>
imap <F1> <Esc>
set tags=tags;/

" set makeprg=jam
set makeprg=ant

set backupdir=./.backup,/tmp,.
set directory=./.backup,/tmp,.

nnoremap @p4e :!p4 edit %
nnoremap @p4a :!p4 add %
nnoremap @p4d :!p4 diff %

"
" Python related stuff
"
" Pylint is the default compiler for python files
"let g:pylint_onwrite = 0
"au FileType python compiler pylint
" Except test files which are run using pytest.
"au! BufNewFile,BufRead test_*.py compiler unit2
" and launched using vim-makegreen
map <leader>rt <Plug>MakeGreen
" Code quality
" Complexity evaluation thanks to GRB
" (https://github.com/garybernhardt/pycomplexity/blob/master/complexity.vim)
map <F5> :call ShowComplexity()<cr>
map <F6> :call Pylint(1)<cr>

" Display tag list
map <F7> :TlistToggle<cr>

let python_highlight_all = 1
let python_slow_sync = 1

au BufRead,BufNewFile ~/code/branches/user/mkidder/DungeonKeeper/dev/game/shared/db_data/* set filetype=javascript
au BufRead,BufNewFile ~/code/branches/user/mkidder/DungeonKeeper/guild_sandbox/game/shared/db_data/* set filetype=javascript

if has("gui")
    inoremap <C-Space> <C-n>
elseif has("unix")
    inoremap <Nul> <C-n>
endif
