#!/bin/bash
sudo cp -i $HOME/.config/i3/utils/plasma-i3.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/plasma-i3.sh
sudo cp -i $HOME/.config/i3/utils/plasma-i3.desktop /usr/share/xsessions/
sudo pacman -S --needed feh picom
