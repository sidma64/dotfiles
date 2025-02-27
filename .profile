# XDG Base Directory Specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

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
if command -v nvim; then
    export EDITOR=nvim
elif command -v vim; then
    export EDITOR=vim
elif command -v vi; then
    export EDITOR=vi
elif command -v nano; then
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
if [ -d "$HOME/.cargo/env" ]
    . "$HOME/.cargo/env"
fi

# Golang
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    if [ -d "$GOBIN" ]; then
        export PATH="$GOBIN:$PATH"   
    fi
fi
