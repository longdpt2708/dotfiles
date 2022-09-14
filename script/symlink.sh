#!/bin/bash

if [ $1 -ne 0 ] ; then
  echo "Symlink file ..."
  echo "$1"
  source ./script/symlink_file.sh
else
  echo "Replace file ...}"
  source ./script/replace_file.sh
fi


linkDotfile .config/polybar
linkDotfile .config/alacritty
linkDotfile .config/bspwm
linkDotfile .config/dunst
linkDotfile .config/nvim
linkDotfile .config/picom
linkDotfile .config/rofi
linkDotfile .config/sxhkd
linkDotfile .config/neofetch
linkDotfile .config/Thunar
linkDotfile .config/lf



linkDotfile .zshrc
linkDotfile .p10k.zsh

# linkDotfile .xinitrc



# linkDotfile .local/bin/lfub
