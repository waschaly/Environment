# The following lines were added by compinstall
zstyle :compinstall filename '/root/.zshrc'
zstyle ':completion:*' special-dirs true

autoload -Uz compinit
compinit

bindkey -v

bindkey "[1~" beginning-of-line
bindkey "[4~" end-of-line
bindkey "" history-incremental-search-backward
bindkey "" history-incremental-search-forward

. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# End of lines added by compinstall
