# Enable vi keybindings
function fish_user_key_bindings
    fish_vi_key_bindings
end

if status is-login
    # Go package manager installations
    set -gx GOPATH $HOME/go
    set -gx GOBIN $GOPATH/bin
    fish_add_path -p $GOBIN

    # Set default BROWSER and EDITOR 
    if not set -q BROWSER
        set -x BROWSER firefox
    end
    if not set -q EDITOR
        set -x EDITOR nvim
    end
    # Setup cargo for rust
    if test -d $HOME/.cargo/
        set -a PATH $HOME/.cargo/bin
    end
end

if status is-interactive
    # Setup Zoxide
    if command -q zoxide
        zoxide init fish | source
    end

    # Set up fzf key bindings
    if command -q fzf
        fzf --fish | source
    end
    # Set up abbreviations
    abbr --add br $BROWSER
    abbr --add e $EDITOR

    # Setup exa for ls
    if command -q eza
        function ls -w eza
            eza -hg --icons --group-directories-first --color=auto $argv
        end
    end

end
