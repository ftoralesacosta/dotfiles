#Navigation
alias rth="ls -lrth"
alias la="ls -lrtha"

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

#Make grep more user friendly by highlighting matches
#and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'

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
alias vs='tmux source-file ~/.tmux.conf'
#ROOT
alias r="root"

#General
export PATH="/usr/local/bin:$PATH"

