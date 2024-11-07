
if status is-login
    fish_add_path /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
    if test uname = "Darwin"
        fish_add_path /opt/homebrew/bin
    end
    # Go package manager installations
    set -gx GOPATH $HOME/go
    set -gx GOBIN $GOPATH/bin
    fish_add_path $GOBIN

    # Set default BROWSER and EDITOR 
    if not set -q BROWSER
        set -gx BROWSER firefox
    end
    if not set -q EDITOR
        set -gx EDITOR nvim
    end
    # Setup cargo for rust
    if test -d $HOME/.cargo/
        fish_add_path $HOME/.cargo/bin
    end
    fish_add_path $HOME/bin $HOME/.local/bin
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

    if command -q eza
        function ls -w eza
            eza -hg --icons --group-directories-first --color=auto $argv
        end
    end
    # Enable vi keybindings
    function fish_user_key_bindings
        fish_vi_key_bindings
    end
end