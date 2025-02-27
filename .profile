# Set PATH to include user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set environment variables
export EDITOR=vi
export VISUAL="$EDITOR"
export PAGER=less
export LESS="-R"

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Rust
. "$HOME/.cargo/env"

# Golang
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    if [ -d $GOBIN ]; then
        export PATH="$GOBIN:$PATH"   
    fi
fi

# Other
