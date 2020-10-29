#!/bin/bash

echo "installing rsnapshot"
sudo pacman -S --needed rsnapshot
echo "moving config"
sudo cp ~/.config/rsnapshot/utils/rsnapshot.conf /etc/rsnapshot.conf
