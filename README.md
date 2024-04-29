# Config file repository
Annoyed of having config files all over the place? This repository is for you!

All configurations can be added here and then the install script will create links for you!

Folders will be placed in the ~/.config folder and any .rc files will be copied to ~/

The idea is that .rc files should be setup to source (or equivalent) files in the ~/.config folder.
Maintaining consistency in these trying times.

## Usage
Just place yourself in the directory where you want your config files to live and run
``` shell
git clone https://github.com/cooperwo1f/.dotfiles.git && sh .dotfiles/install.sh
```
This will create the folder .dotfiles,
obviously if you want a different name you can change it
(but you will need to run install.sh AFTER changing the folder name otherwise the links will be broken)

Clean version deletes any pre-existing configuration files
``` shell
git clone https://github.com/cooperwo1f/.dotfiles.git && sh .dotfiles/install.sh clean
```
