#!/usr/bin/env bash

cat >> ~/.profile << EOF

source ~/.bashrc

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Git
alias gitgraph='git log --graph --all --decorate'

export GREP_OPTIONS='--color=auto'

# Terminal Color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Alias
export LS_OPTIONS='--color=auto -GFh'
alias ls="ls $LS_OPTIONS"


# Log
HISTFILESIZE=10000000

EOF
