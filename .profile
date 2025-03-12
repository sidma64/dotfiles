# XDG Base Directory Specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"


export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

# Create directories if they don't exist
for dir in "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
done

# Set PATH to include user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set environment variables
if [ -n "$(which nvim)" ]; then
    export EDITOR=nvim
elif [ -n "$(which vim)" ]; then
    export EDITOR=vim
elif [ -n "$(which vi)" ]; then
    export EDITOR=vi
elif [ -n "$(which nano)" ]; then
    export EDITOR=nano
fi
[ -n "$EDITOR" ] && [ -z "$VISUAL" ] && export VISUAL="$EDITOR"
export PAGER=nvim
export MANPAGER='nvim +Man!'
# export LESS="-R"

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Rust
if [ -d "$HOME/.cargo" ]; then
    source "$HOME/.cargo/env"
fi

# Golang
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    if [ -d "$GOBIN" ]; then
        export PATH="$GOBIN:$PATH"   
    fi
fi

export ENVFILE="$HOME/.env"
if [ ! -f $ENVFILE ]
then
  export $(cat $ENVFILE | xargs)
fi

# Reboot directly to Windows
# Inspired by http://askubuntu.com/questions/18170/how-to-reboot-into-windows-from-ubuntu
reboot_to_windows ()
{
    windows_title=$(sudo grep -i windows /boot/grub2/grub.cfg | cut -d "'" -f 2)
    sudo grub2-reboot "$windows_title" && sudo reboot
}
alias reboot-to-windows='reboot_to_windows'


# google () {
#     xdg-open https
# }

source "$HOME/.atuin/bin/env"
