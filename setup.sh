#!/bin/bash




#!/bin/bash
PS3='Choose your options: '
options=("Install Application" "Install Desktop" "Symlink (shortcut)" "Symlink (replace file)" "Auto Install Desktop - Symlink (shortcut)" "Auto Install Desktop - Symlink (replace file)" "Install Nerd-Fonts" "Quit")
select opt in "${options[@]}"; do
    case $opt in
        "Install Application")
            ./script/install_package.sh 0
	    # optionally call a function or run some code here
            ;;
        "Install Desktop")
            ./script/install_package.sh 1
	    # optionally call a function or run some code here
            ;;
        "Symlink (shortcut)")
            ./script/symlink.sh 1
	    # optionally call a function or run some code here
            ;;
        "Symlink (replace file)")
            ./script/symlink.sh 0
	    # optionally call a function or run some code here
            ;;
        "Auto Install Desktop - Symlink (shortcut)")
            ./script/install_package.sh 1
            ./script/symlink.sh 1
	    # optionally call a function or run some code here
            ;;
        "Auto Install Desktop - Symlink (replace file)")
            ./script/install_package.sh 1
            ./script/symlink.sh 0
	    # optionally call a function or run some code here
            ;;
        "Install Nerd-Fonts")
            # clone
            git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
            # install
            cd nerd-fonts
            ./install.sh --ttf Meslo Hack SourceCodePro JetBrainsMono FiraCode DejaVuSansMono Iosevka
            # clean-up a bit
            cd ..
            rm -rf nerd-fonts
	    # optionally call a function or run some code here
	    break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
