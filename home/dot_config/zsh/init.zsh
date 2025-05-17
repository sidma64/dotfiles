# Install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Setup Vi mode
set -o vi

# fnm
FNM_PATH="/home/sidma/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/sidma/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Set up fzf key bindings and fuzzy completion
if command -v fzf 2>&1 >/dev/null; then
  source <(fzf --zsh)
fi
# Setup node version manager
if command -v fnm 2>&1 >/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-syntax-highlighting

source ${ZSH}/functions.zsh


if command -v zoxide 2>&1 >/dev/null; then
  eval "$(zoxide init zsh)"
fi
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# zinit light zsh-users/zsh-syntax-highlighting

source ${ZSH}/aliases.zsh
autoload -U compinit promptinit

compinit

if command -v atuin 2>&1 >/dev/null; then
  eval "$(atuin init zsh)"
fi

set -a && source $HOME/.env && set +a
