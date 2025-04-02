# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(fzf --bash)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dnf?='dnf info'

PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
if [[ -n $(which atuin) ]]; then
    eval "$(atuin init bash)"
fi

if [[ -n $(which zoxide) ]]; then
    eval "$(zoxide init bash)"
fi

export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

# if tty -s; then echo 'This is interactive shell.'; else echo 'This is non-interactive shell.'; fi
# if echo $0 | grep -e ^\- 2>&1>/dev/null; then echo "This is login shell."; else echo "This is non-login shell."; fi;

set -a && source $HOME/.env && set +a
