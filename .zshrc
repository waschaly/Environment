# The following lines were added by compinstall
zstyle :compinstall filename '/root/.zshrc'

autoload -Uz compinit
compinit

bindkey -v

bindkey "[1~" beginning-of-line
bindkey "[4~" end-of-line
bindkey "" history-incremental-search-backward
bindkey "" history-incremental-search-forward

# End of lines added by compinstall
