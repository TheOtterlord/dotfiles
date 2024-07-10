#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# FNM
PATH=$PATH:$HOME/.local/share/fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled)"
