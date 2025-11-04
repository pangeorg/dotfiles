#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa -l'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

. "$HOME/.local/bin/env"

export PATH=$PATH:/home/georg/.local/bin
export EDITOR=vim

eval "$(oh-my-posh init bash --config /home/georg/.cache/oh-my-posh/themes/M365Princess.omp.json)"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
# Cargo installs
export PATH=$PATH:/home/georg/.cargo/bin

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
