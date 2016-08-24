

# HISTORY CONTROL WITH ARROWS
HISTCONTROL=ignoredups:ignorespace
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
bind '"\C-w":"\e[A"'
bind '"\C-s":"\e[B"'

# START SCRIPTS
. /afs/mpa/project/vertex/software/noarch/etc/git-completion.bash
setxkbmap -option ctrl:nocaps
shopt -s extglob

# ALIASES & FUNCTIONS
source $HOME/.bash_aliases
source /afs/mpa/project/vertex/software/use.sh

# export pdsoft=/usr/common/pdsoft
# PYTHON
# Decide 2
module load python # _vtk/2.7.11
export PYTHONPATH=$HOME/python:$HOME/.local/lib/python2.7/site-packages/:$PYTHONPATH
# or 3 ?
module load python3/3.5.1 # _vtk/2.7.11
# export PYTHONPATH=$HOME/python:$HOME/.local/lib/python3.5/site-packages/:$PYTHONPATH
export PYTHONWARNINGS="ignore"

export EDITOR=vim
export SHELL=bash
export LANG="en_US.UTF-8"
export TERM=xterm-256color
export VIMRUNTIME=/usr/share/vim/vim74/
# export VIMPATH=$HOME/.local/bin/vim74/bin
# $VIMPATH:
# export VIMRUNTIME=/afs/mpa/home/georgsto/.vim_runtime/:$VIMRUNTIME
# export PATH=$HOME/.local/bin:$HOME/.local/lib:$pdsoft/bin:$pdsoft/common/bin:/afs/ipp-garching.mpg.de/@sys/bin:$PATH
export PATH=$HOME/.local/bin:$HOME/.local/lib:$PATH

# -- COMPILERS AND LIBRARIES

module load intel/14.0
module load gcc
module load impi/1.4.3
module load vertex/hdf5/1.8.10/serial/gnu
# -- LANGUAGES & MISC

module load idl/8.5
module load bash/sshtricks
module load forcheck

# COLORS FOR LS
LS_COLORS=$LS_COLORS'di=0;36:ln=1;31:';export LS_COLORS

# IDL STUFF
export IDL_STARTUP=/afs/mpa/data/georgsto/hotb/idl/default_startup
export F_UFMTENDIAN=big
export IDL_PATH=/afs/ipp/common/soft/idl/idl.8.4/idl_8.4/bin

export PS1="\h \w\$(GIT_PS1_SHOWDIRTYSTATE=1 __git_ps1)> "
export ARCH="amd64-mpa"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

ulimit -s 65532
