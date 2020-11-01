#!/bin/bash

echo "installing rsnapshot"
sudo pacman -S --needed rsnapshot
echo "updating config"
sudo sh -c "sed "23s/.#HOSTNAME#/$HOSTNAME/" $HOME/.config/rsnapshot/utils/rsnapshot.conf > /etc/rsnapshot.conf"
