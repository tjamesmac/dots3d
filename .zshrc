# Used for debugging startup
# zmodload zsh/zprof
#

# m1 macbook check
if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
source ~/.zsh/var.zsh # contains lazy load nvm

export N_PREFIX=$HOME/.n
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/.toolbox/bin
export PATH="$N_PREFIX/bin:$PATH"
export PATH=~/.emacs.d/bin:$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
source ~/.zsh/func.zsh

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
# antidote load

# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi
# Source your static plugins file.
source $zsh_plugins





# Used for debugging startup
# zprof
