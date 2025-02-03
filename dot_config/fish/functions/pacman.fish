function pacrm
    sudo pacman -R (pacman -Qq | fzf)
end

function paci
    sudo pacman -S (pacman -Slq | fzf)
end
