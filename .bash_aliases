#Navigation
alias rth="ls -lrtha"
alias la="ls -lrtha"

#Vim Aliases
alias v="vim"
alias vv="vim ~/.config/nvim/init.lua"
alias cdv="cd ~/.config/nvim/"

#Make grep more user friendly by highlighting matches
#and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'

#Connecting to NERSC
alias nersc="~/.ssh/./sshproxy.sh -u fernando"
alias cori="ssh -i ~/.ssh/nersc fernando@cori02-224.nersc.gov"

#TMUX
alias at='tmux -2 -u a -t'
alias tls='tmux ls'
alias tmx='tmux new-session -s'
alias tkill='tmux kill-session -t'
alias tks='tmux kill-server'
alias vt='v ~/.tmux.conf'
alias vs='tmux source-file ~/.tmux.conf'
#ROOT
alias r="root"

#JUPYTER
alias jls="jupyter notebook list"
alias jkill="jupyter notebook stop"

#Conda
alias tin="conda activate tin" #TensorFlow Env.
alias cls="conda env list" #List Conda Env. "*" indicates active
alias cdeact="conda deactivate"

#General
# export PATH="/usr/local/bin:$PATH"

