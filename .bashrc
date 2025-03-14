#
# ~/.bashrc
#

# If not running interactively, don't do anything
export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
[[ $- != *i* ]] && return

eval "$(fzf --bash)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
if [[ -n $(which atuin) ]]; then
    eval "$(atuin init bash)"
fi

if [[ -n $(which zoxide) ]]; then
    eval "$(zoxide init bash)"
fi
