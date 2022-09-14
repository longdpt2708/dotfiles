#!/bin/bash
source ./script/function.sh

install_by_pacman polybar
install_by_pacman rofi
install_by_pacman rofi-emoji
install_by_pacman picom
install_by_pacman dunst
install_by_pacman neovim
install nvim-packer-git

# file manager
install_by_pacman thunar
install_by_pacman gvfs
install_by_pacman gvfs-mtp
install_by_pacman thunar-volman
install xfce-polkit
install_by_pacman udisks2

# file manager terminal
install lf
install_by_pacman bat
install ueberzug
install man
install lynx
install atool

# zsh
install zsh
chshelltozsh
install_oh_my_zsh
install_pk10
install_zsh_autosuggestions
install_zsh_syntax_highlighting

# nvm
install nvm
# install_powerline_font

# font
# install nerd-fonts-fira-code
# install nerd-fonts-dejavu-complete
# install xfce-polkit
