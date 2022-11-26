export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/.toolbox/bin
export PATH="$N_PREFIX/bin:$PATH"
export PATH=~/.emacs.d/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

source ${ZDOTDIR:-~}/.antidote/antidote.zsh

antidote load

source ~/.zsh/jovial.zsh-theme
source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
source ~/.zsh/env.zsh


