
# Aliases for System Commands
alias ls='ls --color=auto --group-directories-first -v'
alias "l=ls -ltrh"
alias "ll=ls -laFh"
alias "..=cd .."
alias quota='fs listquota'
alias diff='colordiff'
alias rm='rm -i'
alias firefox="firefox --new-tab "
alias untar="tar -xvzf"
alias du="du -sh"
alias ssh="ssh -X -Y"
alias scp="scp -rv"
alias idl="idl -v 8.2"
alias mv="mv -v"
# alias grep="grep -r -i -n --color --exclude=*tag* --exclude=*.git*"

# Handy Aliases
alias hydra="ssh -Y -X georgsto@hydra-i.rzg.mpg.de"
alias mthydra="sshfs -o nonempty ~/hydra/ georgsto@hydra-i.rzg.mpg.de:/u/georgsto/ && sshfs -o nonempty ~/ptmp/georgsto/ georgsto@hydra-i.rzg.mpg.de:/hydra/ptmp/georgsto/"
alias ncg="ssh -Y georgsto@ncg-09"
alias lnx="ssh -Y -X georgsto@lnx-19"
alias texclean="rm -rf *.toc *.log *.aux *.out *.nav *.snm"
alias mtbackup="fs mkm -dir ~/BACKUP -vol home.georgsto.backup"
alias rmbackup="fs rm ~/BACKUP"
alias search="find . -wholename"
# alias qjobs="qstat -u georgsto -xml | tr '\n' ' ' | sed 's#<job_list[^>]*>#\n#g' | sed 's#<[^>]*>##g' | grep ' ' | column -t | sort -u -k 4"
alias loadhp="ipython3 -i ~/.local/bin/loadhp.py --"
alias ipy="ipython3"
alias python="python3"

alias tmux="/usr/local/bin/tmux"
alias work="./.mux"
