" Vundle {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plinginss
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tristen/vim-sparkup'
Plugin 'tComment'
Plugin 'scrooloose/nerdtree'

" Choose window interactively
Plugin 't9md/vim-choosewin'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Colorschemes
Plugin 'nanotech/jellybeans.vim'

" Languages
Plugin 'maksimr/vim-jsbeautify'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype plugin indent on

" }}}


" Redefine <Leader> to ","
let mapleader= ","
" Set 300ms to fire keystroke
set tm=300


" EasyMotion config {{{
let g:EasyMotion_leader_key = '<Leader>'
" }}}


" NERDTree config {{{
:nmap <Leader>q :NERDTreeToggle<CR>
" }}}


" Choosevim
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1



" JavaScript syntax for JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript
" UTF-8 as default encoding
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Display useless characters
set listchars=nbsp:¤,tab:>-,extends:>,precedes:<,trail:·
" See the difference between tabs and spaces and for trailing blanks
set list

" Use the appropriate number of spaces to insert a tab
set expandtab
" Number of spaces that a tab in the file counts for
set tabstop=2
" Number of spaces to use for each step of (auto)indent
set shiftwidth=2
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=2
" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Backup
set backup
set backupdir=/tmp
set directory=/tmp

" Ignore search case
set ic

" The syntax with this name is loaded
syntax on
" Use 256 colors in Console mode if we think the terminal supports it
if &term =~? 'mlterm\|xterm'
  set t_Co=256
endif

" Define color scheme
colorscheme jellybeans

" Show the line number relative to the line with the cursor in front of each line
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Remove white spaces with _s
nmap _s :%s/\s\+$//<CR>

" check php syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap &lt;

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=78

" always jump to last edit position when opening a file
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


" Reload .vimrc when we edit it
au! BufWritePost .vimrc source %

