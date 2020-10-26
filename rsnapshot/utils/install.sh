#!/bin/bash

echo "installing rsnapshot"
sudo pacman -S rsnapshot
echo "moving config"
sudo mv ~/.config/rsnapshot/utils/rsnapshot.conf /etc/rsnapshot.conf
