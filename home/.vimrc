call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'https://github.com/AndrewRadev/vim-eco'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/lifepillar/vim-solarized8'
Plug 'https://github.com/bkad/CamelCaseMotion'
Plug 'https://github.com/briancollins/vim-jst'
Plug 'https://github.com/chrisbra/csv.vim'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/depuracao/vim-rdoc'
Plug 'https://github.com/ecomba/vim-ruby-refactoring'
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/hashivim/vim-terraform'
Plug 'https://github.com/joukevandermaas/vim-ember-hbs'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kchmck/vim-coffee-script'
Plug 'https://github.com/keith/swift.vim'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/mmai/wikilink'
Plug 'https://github.com/nelstrom/vim-textobj-rubyblock'
Plug 'https://github.com/othree/html5.vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/pbrisbin/vim-mkdir'
Plug 'https://github.com/rodjek/vim-puppet'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/skwp/vim-rspec'
Plug 'https://github.com/slim-template/vim-slim'
Plug 'https://github.com/tomtom/tlib_vim'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-git'
Plug 'https://github.com/tpope/vim-markdown'
Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/tpope/vim-rails'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tsaleh/vim-align'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/vim-scripts/DeleteTrailingWhitespace'
Plug 'https://github.com/vim-scripts/ShowTrailingWhitespace'

if filereadable(glob("~/.vim/local/vimplug"))
  source ~/.vim/local/vimplug
endif

" Initialize plugin system
call plug#end()

" Don't emulate vi bugs (must be first; has side effects)
set nocompatible

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

  " Make sure markdown files use markdown mode
  au BufNewFile,BufRead *.md setfiletype markdown
  au BufNewFile,BufRead *.markdown setfiletype markdown

  " Enable spell checking for markdown files
  au BufNewFile,BufRead *.md setlocal spell
  au BufNewFile,BufRead *.markdown setlocal spell

  " Enable spell checking for git commits
  au FileType gitcommit setlocal spell

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

if has('termguicolors')
  " fix truecolor bug for vim
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:solarized_termtrans = 1
set background=dark
colorscheme solarized8

let g:ShowTrailingWhitespace = 1
highlight ShowTrailingWhitespace ctermbg=Red guibg=Red
let g:DeleteTrailingWhitespace = 1
autocmd BufRead,BufNewFile db/structure.sql let g:DeleteTrailingWhitespace = 0
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
" for old people
cnoreabbrev W w
cnoreabbrev Tabe tabe

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:ale_scss_stylelint_executable = 'stylelint'

let g:ale_javascript_eslint_executable = 'eslint'

let g:ale_eruby_ruumba_executable = 'bundle'
let g:ale_eruby_ruumba_options = '-e'

let g:ale_ruby_ruby_executable = 'ruby'
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {
      \'ruby': ['rubocop', 'ruby'],
      \'eruby': ['erubi', 'ruumba'],
      \'javascript': ['eslint'],
      \'scss': ['stylelint'],
      \}

let g:ale_fixers = {
      \'*': ['remove_trailing_lines'],
      \'javascript': ['eslint'],
      \'scss': ['stylelint'],
      \'ruby': ['rubocop'],
      \}
let g:ale_fix_on_save_ignore = ['stylelint', 'eslint', 'rubocop']
let g:ale_fix_on_save = 1

" gitgutter: make the gutter always show, so it doesn't shift
set signcolumn=yes
" aliases for gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Re-indent the whole file and go back to where you were
map <leader>= gg=G''

" don't load everything in .git into the ctrl-p buffer
" source: https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set foldmethod=indent
" foldevalstart approximates a 'don't automatically fold everything when a file is
" opened' setting
set foldlevelstart=99

" don't hide quoting in json files
" https://github.com/elzr/vim-json#common-problems
let g:vim_json_syntax_conceal = 0

runtime! macros/matchit.vim

" putting this here so users can override anything specified above
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
