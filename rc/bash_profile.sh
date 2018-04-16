#!/usr/bin/env bash

cat >> ~/.profile << EOF

source ~/.bashrc

# Variables
__ls_options="-GFh"
__grep_options="--color=auto"

# Function
__current_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

__pump_git_branch() {
  if [ ! -z $(__current_git_branch) ]; then
    echo \($(__current_git_branch)\)
  fi
}

# Shortcut
alias ls="ls ${__ls_options}"
alias grep="grep ${__grep_options}"
alias gitgraph="git log --graph --all --decorate"
gitsync() {
  git pull upstream $(__current_git_branch) && git push origin $(__current_git_branch)
}

# Terminal Color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PS1="\u@\h \[\033[32m\]\W\[\033[33m\] \$(__pump_git_branch)\[\033[00m\]$ "

EOF
