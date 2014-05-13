" Don't emulate vi bugs (must be first; has side effects)
set nocompatible

" Load Pathogen bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set number
set ruler
syntax on
set lazyredraw " Don't try to continuously update the screen during macros (makes things go faster)

set smartindent

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Wrapping
set showbreak=...
set wrap linebreak nolist

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Buffers
set hidden

" Status bar
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set showcmd

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" use comma as <Leader> key instead of backslash
let mapleader=","

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

syntax enable
let g:solarized_termtrans = 1
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

let g:ShowTrailingWhitespace = 1
highlight ShowTrailingWhitespace ctermbg=Red guibg=Red
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" Enable per-directory .vimrc files, but don't allow insecure commands.
set exrc
set secure

" bind nerdtree to \
map \ :NERDTreeToggle<CR>

map <Leader>p gg:s/\s*$<CR>/\d\+-<CR>ywggA [#<esc>pa]<esc>
nmap <Leader>l iLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<esc>

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

vmap <Leader>z :call I18nTranslateString()<CR>

" Replace double quotes with single quotes on the current line.
nmap <Leader>' :.s/"/'/g<CR>:nohlsearch<CR>

abbrev teh the
abbrev yuo you
abbrev hte the
abbrev nad and
abbrev frmo from
abbrev buig bug
abbrev jsut just
abbrev tempalte template
abbrev teamplate template
abbrev flase false
abbrev ptus puts
