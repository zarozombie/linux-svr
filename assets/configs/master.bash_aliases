#source syncs bash terminal source ~/.bash_aliases
alias l=ls
alias ls=ls\ --color=auto
alias la=ls\ -la
alias b=cd\ ../
alias s=source\ ~/.bash_aliases
alias tmuxe=vim\ ~/.tmux.conf
alias dev=cd\ /media/sf_linode/linux-svr

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias home="cd ~"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline --graph --decorate"

# System
alias update="sudo apt update && sudo apt upgrade -y"  # For Ubuntu/Debian
alias c="clear"
alias h="history"

# Python virtual environment
alias venv="python3 -m venv ./venv"
alias activate="source ./venv/bin/activate"

# Docker (additional to those mentioned earlier)
alias dps="docker ps"
alias dimg="docker images"
alias drmi="docker rmi"
alias dexec="docker exec -it"