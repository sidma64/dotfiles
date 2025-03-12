export ZSH=$HOME/.config/zsh
source $ZSH/init.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
