function install_by_pacman {
  pacman -Qs $1 &> /dev/null
  if [ $? -ne 0 ] ; then
    echo "Installing: ${1}..."
    sudo pacman -S --needed --no-confirm $1
  else
    echo "Already installed: ${1}"
  fi
}


function install_yay {
  which yay &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: yay..."
    sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay
  else
    echo "Already installed: yay"
  fi

}

function install_by_yay {
  yay -Qs $1 &> /dev/null
  if [ $? -ne 0 ] ; then
    echo "Installing: ${1}..."
    yay -S --save --answerclean All --answerdiff All --nocleanmenu --nodiffmenu --noconfirm $1
  else
    echo "Already installed: ${1}"
  fi
}

# function install_by_git {
#   which $1 &> /dev/null

#   if [ $? -ne 0 ]; then
#     echo "Installing: ${1}..."
#     sudo pacman -S --needed --no-confirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd $1 && makepkg -si && cd .. && rm -rf yay
#   else
#     echo "Already installed: ${1}"
#   fi

# }
