#!/bin/bash

# clone
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
# install
cd nerd-fonts
./install.sh --otf -S  Meslo Hack SourceCodePro JetBrainsMono FiraCode DejaVuSansMono Iosevka
# clean-up a bit
cd ..
rm -rf nerd-fonts
