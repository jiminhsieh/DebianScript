#!/usr/bin/env bash

cat > ~/.vimrc << EOF
set mouse-=a
set backspace=indent,eol,start

syntax on
colorscheme desert

set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

EOF
