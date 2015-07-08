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

  " Enable spell checking for markdown files
  au BufNewFile,BufRead *.md setlocal spell
  au BufNewFile,BufRead *.markdown setlocal spell

  " Enable spell checking for git commits
  au FileType gitcommit setlocal spell

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

" Based on http://robots.thoughtbot.com/faster-grepping-in-vim
" bind K to grep word under cursor
" nnoremap K :Ggrep "\b<C-R><C-W>\b"<CR>:cw<CR>
map K <Nop>

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


" Turn `x = expr` into `let(:x) { expr }`, via comma-"let"
nmap <Leader>let Ilet(:<esc>ea)<esc>f=r{A }<esc>

" Select some ruby, comma-"var", and it'll extract a local variable.
vmap <Leader>var cyour_variable<esc>Oyour_variable = <esc>p0*

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

vmap <Leader>z :call I18nTranslateString()<CR>

" Replace double quotes with single quotes on the current line.
nmap <Leader>' :.s/"/'/g<CR>:nohlsearch<CR>

" Change 1.8 hash syntax on the current line to 1.9.
" NB: this isn't perfect, but it's pretty good.
" List of valid symbol chars: https://gist.github.com/misfo/1072693
map <Leader>9 :.s/:\([_a-z0-9]\{1,}\) *=>/\1:/g<CR>:nohlsearch<CR>

" Set a toggle for pastemode, using v which has a strong association with
" paste
map <leader>v :set paste!<CR>

" Rename current file. Hit enter after adjusting file name. Will reload vim
" buffer
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
endfunction
map <leader>mv :call RenameFile()<cr>

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
abbrev contorl control
abbrev Contorl Control

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" enable scss-lint, gem install scss-lint is required
let g:syntastic_scss_checkers = ['scss_lint']

" jscs requires a config file or it blows up
" if there is a config file include it, otherwise don't
let g:syntastic_javascript_checkers = findfile('.jscsrc', '.;') != '' ? ['jshint', 'jscs'] : ['jshint']

" syntastic: add statusline flag
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" gitgutter: make the gutter always show, so it doesn't shift
let g:gitgutter_sign_column_always = 1

" Re-indent the whole file and go back to where you were
map <leader>= gg=G''

" don't load everything in .git into the ctrl-p buffer
" source: https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set foldmethod=syntax
set foldlevelstart=99
