inoremap jk <ESC>

let mapleader = "\<Space>"

execute pathogen#infect()
filetype plugin indent on
syntax on
set encoding=utf-8
set number

"============"
   "Vundle"
"============"

set shell=/bin/bash

set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
"let path='$HOME/.vim/bundle'
call vundle#begin('$HOME/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-sensible'

Plugin 'danro/rename.vim'

Plugin 'JuliaLang/julia-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

"============"
"Key Mappings"
"============"
map <C-n> :NERDTreeToggle<CR>

"For adding new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"Nerd Tree Setup
nnoremap <Leader>d :NERDTree<CR>
map <Leader>t :NERDTreeToggle<cr>

"============"
   "Style"
"============"

"Ensures conformity to PEP-8 Length guideline <80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

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