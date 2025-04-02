#
# ~/.bash_profile
#
source $HOME/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc


if [ -e /home/sidma/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sidma/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
