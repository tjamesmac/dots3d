export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"

plugins=(
  node
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

source ~/.config/jovial.zsh-theme
export PATH=$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH=~/.emacs.d/bin:$PATH

DISABLE_UNTRACKED_FILES_DIRTY="true"

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Aliases go here
alias root="cd"
alias ls="exa --oneline --all"
alias dots="root && cd ./dots2"
alias config="root && cd .config"
alias side="root && cd ./side"
alias learning="root && cd ./learning"
alias problems="root && cd ./problems"
alias notes="root && cd ./notes"
alias nn="root && cd ./notes && nvim"
alias rgf="rg --files | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias package="yarn"
alias todo="notes && nvim TODO.md"
# Git
alias gbr="git branch --show-current"
alias gc="git commit"
alias gps="git push"
alias gpl="git pull"
alias gs="git status"
alias gsw="git switch"
alias ga="git add"
alias gaa="git add ."
alias ghprlg="gh pr list -l 'Guardians 🛡'"
alias viewpr="~/side/gum/gh.sh"

# The LEGO group aliases
# TODO Make these have a root of oct if they cd
alias oct="cd && cd ./repo/octan"
alias repo="cd && cd ./repo"
alias stopoct="oct && yarn pm2 stop all"
alias moon="cd && cd ./repo/moonbase"
alias conman="cd && cd ./repo/octan/packages/consent-manager"
alias octlog="octan login -u gbthjamc -k"
alias logplay="octlog -e 'Playground'"
alias logdev="octlog -e 'Development' -t 0"
alias gdev="oct && git checkout develop"
alias packages="cd && cd ./repo/octan/packages"
alias appshop="cd && cd ./repo/octan/packages/app-shop"
alias gateway="cd && cd ./repo/octan/packages/graphql-gateway"
alias cy="cd && cd ./repo/octan/packages/cypress"
alias cydai="cy && PROJECT=dataAndInsights yarn open"
alias cysmoke="cy && PROJECT=smoke yarn open"
alias rest="oct && stopoct && yarn reset-modules && yarn && yarn codegen && yarn dev"
alias restnav="oct && stopoct && yarn reset-modules && yarn && yarn codegen && COMPILE_SERVICE_NAV=1 yarn dev"
# TODO make this an actual function script
alias ydd="package deploy:dev"
alias ydr="package remove:dev"
alias yt="package test"
alias yit="package integration:test"
alias lad="logplay && ydd"

# Service aliases for octan
alias s="cd && oct && cd ./services"
alias scon="s && cd ./service-consent"
alias snew="s && cd ./service-newsletter"
alias srec="s && cd ./service-recommendation-feed"
alias sdlo="s && cd ./service-data-layer-optimizely"
alias sdlr="s && cd ./service-data-layer-recsengine"
alias sdlnr="s && cd ./service-data-layer-newrelic"
alias ste="s && ./service-transactional-email"
alias sce="s && ./service-connector-endpoints"
alias sac="s && ./service-subscriber-acquisition"

bindkey '^ ' autosuggest-execute

# bun completions
# [ -s "/Users/gbthjamc/.bun/_bun" ] && source "/Users/gbthjamc/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

eval $(thefuck --alias)
