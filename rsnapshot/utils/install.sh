#!/bin/bash

echo "installing rsnapshot"
sudo pacman -S --needed rsnapshot
echo "updating config"
sed -i "23s/.#HOSTNAME#/$HOSTNAME/" $HOME/.config/rsnapshot/utils/rsnapshot.conf
echo "moving config"
sudo cp $HOME/.config/rsnapshot/utils/rsnapshot.conf /etc/rsnapshot.conf
