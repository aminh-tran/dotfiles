" backspace in insert mode works like normal editor
set backspace=2

" Set text width to 72 characters
:set textwidth=72

" syntax highlighting
syntax on

" activates indenting for files
filetype indent on

" auto indenting
set autoindent

" line numbers
set number

" get rid of anoying ~file:
set nobackup

" Change leader
let mapleader = " "

" Set compatibilty to vim only
set nocompatible

" Encoding
set encoding=utf-8

" Ignore case in searches
set ignorecase

" Including a upcassed letter will switch search to case sensitive
set smartcase

" Status bar
set laststatus=2

" https://dev.to/elvessousa/my-/basic-neovim-setup-253l
" Apply color set for dark screens
set background=dark

" Use system clipboard
" set clipboard+=unnamedplus

" :help <setting> for description
set complete+=kspell

" Modifies auto complete menu to behave more like an IDE
set completeopt=noinsert,menuone,noselect
" set completeopt=menuone,longest

set shortmess+=c

" Hides unused buffers
set hidden

" Allow use of mouse
set mouse=a

" Show relative numbers from current line
set relativenumber

" Show the file title
set title

" Set time in milliseconds to run commands
set ttimeoutlen=1000

" Turn tabs into spaces
set expandtab

" Number of spaces for indentation
set shiftwidth=2

" Number of spaces for tabs
set tabstop=2

" Syntax support
filetype plugin indent on
syntax on

" COLOR SUPPORT
"==============

" Enable 256 colors in terminal
set t_Co=256

" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

" NetRW FILE BROSWER
" ==================

" Hides the default top banner
let g:netrw_banner=0

" Change the display of files
" 0 -> shows only 1 dir at a time
" 1 -> shows files data
" 2 -> shows fiels in columns
" 3 -> shows as a tree where open dir's are expanded
let g:netrw_liststyle=3

" Changes how files are opened
" 0 -> opens files in a horizontal split
" 1 -> opens in a vertical split
" 2 -> opens in a new tab
" 3 -> opens in a previous window, avoiding the creation of more divisions
let g:netrw_browse_split=4

" Switches NetRW display to the left
let g:netrw_altv=1

" Limits window size to 25% of available space
let g:netrw_winsize=25

" Keeps the dir accessed previously
let g:netrw_keepdir=0

" Modifies command used to copy files to allow for folder copy
let g:netrw_localcopydircmd='cp -r'

" REMAPS
" ======
inoremap jj <Esc>

