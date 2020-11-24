#!/bin/bash
sudo chmod +x $HOME/.config/i3/utils/plasma-i3.sh
sudo cp -i $HOME/.config/i3/utils/plasma-i3.sh /usr/local/bin/
sudo cp -i $HOME/.config/i3/utils/plasma-i3.desktop /usr/share/xsessions/
sudo pacman -S --needed feh picom i3-gaps
