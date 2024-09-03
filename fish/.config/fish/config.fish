function fish_user_key_bindings
  fish_vi_key_bindings
end

# Setup Zoxide
zoxide init fish | source

# Set up fzf key bindings
fzf --fish | source

# Go package manager installations
set GOPATH $HOME/go
set GOBIN $GOPATH/bin
set PATH $PATH:$GOBIN

abbr browser $BROWSER
abbr br $BROWSER
abbr editor $EDITOR
abbr e $EDITOR

if status is-interactive
    # Commands to run in interactive sessions can go here
end


