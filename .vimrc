let mapleader = "\<Space>"

filetype plugin on
syntax on
set clipboard=unnamed
if $TMUX == ''
    set clipboard+=unnamed
endif
set encoding=utf-8
set esckeys

"Line number management
set relativenumber
set number
"for turning off line numbers
nmap <C-N><C-N> :set invnumber \| :set invrelativenumber<CR>

"============="
  "Solarized"
"============="
set background=dark
colorscheme solarized

"============="
   "Vundle"
"============="
"
set shell=/bin/bash

set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
"let path='$HOME/.vim/bundle'
call vundle#begin('$HOME/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-sensible'

Plugin 'danro/rename.vim'

Plugin 'JuliaLang/julia-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

"============="
" INDENTATION "
"============="
"
"" Render tabs as 4 spaces
set tabstop=4                   " Tabs are four spaces
set softtabstop=4               " Tabs counts as four spaces
set shiftwidth=4                " << >> gives you four spaces

" For those who have the sanity to use 4 spaces
set smarttab
set expandtab

set autoindent                  " Auto indent
set smartindent                 " Smart indent

"Damian Conway's Die Blinkënmatchen: highlight matches
set hlsearch

nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"==================="
"Thanks @micahjsmith"
"==================="
set nobackup
set nowb
set noswapfile

"Save pinky finger from harm.
inoremap jk <Esc> 
vnoremap jk <Esc>

"============"
"Brady's Junk"
"============"
" persist undo
let undodir = '$HOME/.vim/undodir'
call system('mkdir -p ' . undodir)
set undofile

" persist last cursor position
call system('mkdir -p' . '$HOME/.vim/view')
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" Fast Scroll
map <C-J> 5j
map <C-K> 5k

set shortmess+=A
