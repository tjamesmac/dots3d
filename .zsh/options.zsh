# Z-Vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=nvim
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#565f89,bold"

# History
HISTFILE=~/.zsh/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

bindkey '^[' autosuggest-execute
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
