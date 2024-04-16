# Z-Vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=nvim

# History
HISTFILE=~/.zsh/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt inc_append_history
setopt share_history

# bindkey '^[ ' autosuggest-execute
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
