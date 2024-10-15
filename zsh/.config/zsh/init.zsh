ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Setup node version manager
if command -v fnm 2>&1 >/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light jeffreytse/zsh-vi-mode

source ${ZSH}/functions.zsh

alias firefox="firefox & disown"
eval "$(zoxide init zsh)"

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# zinit light zsh-users/zsh-syntax-highlighting

source ${ZSH}/aliases.zsh
