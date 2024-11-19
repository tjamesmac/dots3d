alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."

# Git
alias gs="git status -s -b"
alias gsw="git switch"
alias gpl="git pull"
alias gaa="git add --all"
alias gps="git push"
alias gl="git log --pretty=format:'%C(Yellow)%h%Cgreen%d%Cblue %cl%Creset %s'"


alias python="python3"
alias ls="eza --all"

alias gb="git branch --sort=-committerdate | gum filter | xargs git switch"

alias dt="deno task"
alias dr="deno run -A"

alias vim="nvim"
alias em="emacsclient -t -a ''"
alias s="npm run server"
alias sw="npm run server:watch"
alias ww="npm run webpack-watch"
alias lg="lazygit"

# glab
alias gvw="glab mr view --web"
