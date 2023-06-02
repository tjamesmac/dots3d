alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias auth="kinit -f && mwinit"
alias ada-dvwebnode="ada credentials update --account 092058474738 --provider conduit --role DevDesktopWinApp —profile default"
alias startdvwebnode="brazil-build start -- --template=spa --cache --appName=PVWinApp"

# Brazil
alias bb="brazil-build"

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
