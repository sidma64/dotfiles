# Enable vi keybindings
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
set PATH $PATH $GOBIN

# Set default BROWSER and EDITOR 

if not set -q BROWSER
  set BROWSER firefox
end

if not set -q EDITOR
  set EDITOR nvim
end

abbr --add browser $BROWSER
abbr --add br $BROWSER
abbr --add editor $EDITOR
abbr --add e $EDITOR

if status is-interactive
    # Commands to run in interactive sessions can go here
end


