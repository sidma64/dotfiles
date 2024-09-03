function fish_user_key_bindings
  fish_vi_key_bindings
end

# Setup Zoxide
zoxide init fish | source

# Set up fzf key bindings
fzf --fish | source

# Go package manager installations
set PATH $PATH:$HOME/go/bin

abbr browser $BROWSER
abbr br $BROWSER
abbr editor $EDITOR
abbr e $EDITOR

if status is-interactive
    # Commands to run in interactive sessions can go here
end


