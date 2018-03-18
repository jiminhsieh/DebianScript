#!/usr/bin/env bash

cat > ~/.vimrc << EOF
set mouse-=a
set backspace=indent,eol,start

syntax on
colorscheme desert

EOF
