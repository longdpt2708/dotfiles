#!/bin/bash

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
  if [ $currentShell == "/bin/zsh" ] ; then
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
	  echo "Already installed: zsh-autosuggestions"
  else
 	  echo "zsh-autosuggestions is not installed"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
}

function install_zsh_syntax_highlighting {
  if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
	  echo "Already installed: zsh-syntax-highlighting"
  else
 	  echo "zsh-syntax-highlighting is not installed"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  fi
}

function mkdir_local_bin {
  if [ -d ${HOME}/.local/bin ]; then
    echo "Directoty ${HOME}/.local/bin is exists"
  else
    echo "Create directoty: ${HOME}/.local/bin"
    mkdir -p ${HOME}/.local/bin
  fi
}

function mkdir_local_share_fonts {
  if [ -d ${HOME}/.local/share/fonts ]; then
    echo "Directoty ${HOME}/.local/share/fonts is exists"
  else
    echo "Create directoty: ${HOME}/.local/share/fonts"
    mkdir -p ${HOME}/.local/share/fonts
  fi
}

function mk_zsh_history {
  if [ -f ${HOME}/.zsh_history ]; then
    echo "Directoty ${HOME}/.local/share/fonts is exists"
  else
    echo "Create directoty: ${HOME}/.zsh_history"
    touch ${HOME}/.zsh_history
    mv ~/.zsh_history ~/.zsh_history_bad
    strings -eS ~/.zsh_history_bad > ~/.zsh_history
    rm ~/.zsh_history_bad
  fi
}

# function install_powerline_font {
#   # clone
#   git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
#   # install
#   cd nerd-fonts
#   ./install.sh --ttf Meslo Hack SourceCodePro JetBrainsMono FiraCode DejaVuSansMono
#   # clean-up a bit
#   cd ..
#   rm -rf nerd-fonts
# }

function install_lightdm_webkit2_greeter_theme_glorious {
   if [ -f /usr/share/lightdm-webkit/themes/glorious ]; then
    echo "Already installed: lightdm-webkit2-greeter-theme-glorious"
  else
    # clone
    git clone https://github.com/manilarome/lightdm-webkit2-theme-glorious.git --depth=1
    # install
    sudo cp -r lightdm-webkit2-theme-glorious /usr/share/lightdm-webkit/themes/glorious
    # clean-up a bit
    rm -rf lightdm-webkit2-theme-glorious
    # Set default lightdm greeter to lightdm-webkit2-greeter
    sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
    # Set default lightdm greeter to lightdm-webkit2-greeter
    sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
    # Set default lightdm-webkit2-greeter theme to Glorious
    sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
    sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
  fi
}

function install_tpm {
   if [ -d ${HOME}/.config/tpm/plugins/tpm ]; then
    echo "Already installed: tpm"
  else
    # clone
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.config/tpm/plugins/tpm
  fi
}

function mkdir_if_not_exists {
  if [ -d $1 ]; then
    echo "Directoty ${1} is exists"
  else
    echo "Create directoty: ${1}"
    mkdir -p $1
  fi
}

function install_mpv_themes {
  #  if [ -d ${HOME}/.config/tpm/plugins/tpm ]; then
  #   echo "Already installed: tpm"
  # else
    # clone
    git clone https://github.com/maoiscat/mpv-osc-modern
    mkdir_if_not_exists ${HOME}/.config/mpv/scripts
    mv mpv-osc-modern/modern.lua ~/.config/mpv/scripts

    mkdir_if_not_exists ${HOME}/.config/mpv/fonts
    mv mpv-osc-modern/Material-Design-Iconic-Font.ttf ~/.config/mpv/fonts
    rm -rf mpv-osc-modern
  # fi
}


function install_gtk_dracula {
  if [ -d /usr/share/themes/Dracula ]; then
	  echo "Already installed: GTK Dracula"
  else
 	  echo "GTK Dracula is not installed"
    sudo git clone https://github.com/dracula/gtk.git /usr/share/themes/Dracula
  fi
}

function install_gtk_dracula_icon {
  if [ -d /usr/share/icons/Dracula ]; then
	  echo "Already installed: GTK Dracula Icon"
  else
 	  echo "GTK Dracula Icon is not installed"
    sudo git clone https://github.com/m4thewz/dracula-icons /usr/share/icons/Dracula
  fi
}
