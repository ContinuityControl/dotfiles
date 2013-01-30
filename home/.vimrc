" Don't emulate vi bugs (must be first; has side effects)
set nocompatible

" Load Pathogen bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable per-directory .vimrc files, but don't allow insecure commands.
set exrc
set secure
