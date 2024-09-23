fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# plugins idk
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh-alias
source ~/.env

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=500
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/feesh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

echo
pokeget random --hide-name
echo

eval "$(zoxide init zsh)"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey  "^[[3~"  delete-char
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
