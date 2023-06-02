export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/.toolbox/bin
export PATH="$N_PREFIX/bin:$PATH"
export PATH=~/.emacs.d/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

abcd() {
  cd $(~/go/bin/abcd)
}

# Go stuff
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export GOPROXY=direct

source ${ZDOTDIR:-~}/.antidote/antidote.zsh

gswc () {
  git branch | gum filter | xargs git switch
}

source ~/.zsh/jovial.zsh-theme
source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
source ~/.zsh/env.zsh

antidote load



