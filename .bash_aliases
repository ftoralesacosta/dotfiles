#Source and Edit
alias sbp="source ~/.profile"
alias ebp="vim ~/.profile"

#Navigation
alias rth="ls -lrtha"
alias cdft="cd ~/Documents/"

#Emacs Typo Aliases
alias emas="emacs"
alias emac="emacs"
alias eamcs="emacs"
alias emcas="emacs"
alias e="emacs"
#alias emacs="vim"

#Vim Aliases
alias v="vim"
alias vv="vim ~/.vimrc"
alias sv="source ~/.vimrc"

#Connecting to NERSC
alias nersc="~/.ssh/./sshproxy.sh -u fernando"
alias cori="ssh -i ~/.ssh/nersc fernando@cori02-224.nersc.gov"

#TMUX
alias at='tmux -u a -t'
alias tls='tmux ls'
alias tmx='tmux new-session -s'
alias tkill='tmux kill-session -t'
alias tks='tmux kill-server'
alias vt='vim ~/.tmux.conf'
#ROOT
alias r="root"

#General
export PATH="/usr/local/bin:$PATH"
