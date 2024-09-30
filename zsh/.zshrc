
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Setup node version manager
eval "$(fnm env --use-on-cd --shell zsh)"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light jeffreytse/zsh-vi-mode

source ${ZSH}/functions.zsh

alias firefox="firefox & disown"
eval "$(zoxide init zsh)"

export ZSH=$HOME/.config/zsh
