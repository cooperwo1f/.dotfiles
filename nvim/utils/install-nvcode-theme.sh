#!/bin/bash

cp nvcode.yml ../autoload/plugged/nvcode.vim/nvcode.yml &&
cd ../autoload/plugged/nvcode.vim/ &&
sh update_colorscheme.sh
