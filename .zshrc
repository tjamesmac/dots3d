# Used for debugging startup
# zmodload zsh/zprof


# m1 macbook check
if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/options.zsh
source ~/.zsh/var.zsh # contains lazy load nvm

export PATH="$HOME/code/depot_tools:${PATH}"
export N_PREFIX=$HOME/.n
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/.toolbox/bin
export PATH="$N_PREFIX/bin:$PATH"
export PATH=~/.emacs.d/bin:$PATH
export PATH=~/.config/emacs/bin:$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
# eval "$(starship init zsh)"
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

autoload -Uz promptinit && promptinit && prompt pure

# bun completions
[ -s "/Users/tmcauliffe/.bun/_bun" ] && source "/Users/tmcauliffe/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/tmcauliffe/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Used for debugging startup
# zprof
