alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."

# Git
alias gs="git status"
alias gsw="git switch"
alias gpl="git pull"
alias gaa="git add --all"
alias gps="git push"
alias gl="git log --pretty=format:'%C(Yellow)%h%Cgreen%d%Cblue %cl%Creset %s'"


alias ls="exa --oneline --all"

alias gamma="ssh $MYHOST"

alias gb="git branch --sort=-committerdate | gum filter | xargs git switch"

alias dt="deno task"
