function install_by_pacman {
  pacman -Q $1 &> /dev/null
  if [ $? -ne 0 ] ; then
    echo "Installing: ${1}..."
    sudo pacman -S --needed --noconfirm $1
  else
    echo "Already installed: ${1}"
  fi
}


function install_yay {
  which yay &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: yay..."
    sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
  else
    echo "Already installed: yay"
  fi

}

function install {
  yay -Q $1 &> /dev/null
  if [ $? -ne 0 ] ; then
    echo "Installing: ${1}..."
    yay -S --save --answerclean All --answerdiff All --nocleanmenu --nodiffmenu --noconfirm $1
  else
    echo "Already installed: ${1}"
  fi
}

function chshelltozsh {
  currentShell=$SHELL
  if [ $currentShell == "/usr/bin/zsh" ] ; then
    echo "Current Shell is ZSH"
  else
    echo "Change Shell to ZSH"
    chsh -s /bin/zsh
  fi
}
function install_pk10 {
  which p10k &> /dev/null

  if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    echo "Already installed: pk10"
  else
    echo "Installing: pk10"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  fi
}

function install_oh_my_zsh {
  if [ -d ~/.oh-my-zsh ]; then
	  echo "Already installed: oh-my-zsh"
  else
 	  echo "oh-my-zsh is not installed"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

function install_zsh_autosuggestions {
  if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
	  echo "Already installed:: zsh-autosuggestions"
  else
 	  echo "zsh-autosuggestions is not installed"
    git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
}

function install_zsh_syntax_highlighting {
  if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
	  echo "Already installed:: zsh-syntax-highlighting"
  else
 	  echo "zsh-syntax-highlighting is not installed"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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
