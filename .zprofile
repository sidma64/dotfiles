#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#       Hyprland 
#fi

emulate sh
if [[ -f $HOME/.profile ]]; then
  . $HOME/.profile
fi
emulate zsh
