export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/.toolbox/bin
export PATH="$N_PREFIX/bin:$PATH"
export PATH=~/.emacs.d/bin:$PATH
# need this for M1
# eval "$(/opt/homebrew/bin/brew shellenv)"

# abcd() {
#   cd $(~/go/bin/abcd)
# }

# Go stuff
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export GOPROXY=direct

# source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# this is the homebrew installation
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

gswc () {
  git branch | gum filter | xargs git switch
}

source ~/.zsh/jovial.zsh-theme
source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
# source ~/.zsh/env.zsh
eval "$(zoxide init zsh)"

antidote load



