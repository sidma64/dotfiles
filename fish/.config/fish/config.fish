# Setup completions for 1Password
if command -q op
  op completion fish | source
end

# Add local bin to path
set -a PATH $HOME/.local/bin

# Enable vi keybindings
function fish_user_key_bindings
  fish_vi_key_bindings
end

# Setup cargo for rust
set -a PATH $HOME/.cargo/bin

# Setup fnm for node version manager
fnm env --use-on-cd --shell fish | source

# Setup fisher for fish plugin manager
if command -q fisher
  echo "you need to install fisher - https://github.com/jorgebucaran/fisher#installation"
end

# Setup exa for ls
if command -q exa
  function ls -w exa
    exa -hg --icons --group-directories-first --color=auto $argv
  end
else
  echo "you need to install exa - https://github.com/ogham/exa#installation"
end

# Setup Zoxide
if command -q zoxide
  zoxide init fish | source
end

# Set up fzf key bindings
if command -q fzf
  fzf --fish | source
end

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

# Set up abbreviations
abbr --add browser $BROWSER
abbr --add br $BROWSER
abbr --add editor $EDITOR
abbr --add e $EDITOR

if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -q op
      # eval $(op signin)
    end
end


