#!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$HOME/.config"

sudo echo "got root"

echo "homepath = $HOME"
echo "BASE_DIR = $BASE_DIR"
echo "CONFIG_DIR = $CONFIG_DIR"

linkFolders=`find $BASE_DIR/* -maxdepth 0 -type d -exec realpath --relative-to=$BASE_DIR {} \;`
linkFiles=`find $BASE_DIR/. -maxdepth 1 -type f -name ".[^.]*" -exec realpath --relative-to=$BASE_DIR {} \;`

if [ "$1" = "clean" ]; then
  echo "doing clean install"
fi

mkdir -p $CONFIG_DIR

echo "linking folders"
for i in $linkFolders; do
  if [ "$1" = "clean" ]; then
    rm -r -f $CONFIG_DIR/$i
  fi
  
  ln -s -v -i $BASE_DIR/$i $CONFIG_DIR/

done

echo "copying files"
for i in $linkFiles; do
  if [ "$i" = ".gitignore" ]; then
    continue
  fi

  if [ "$1" = "clean" ]; then
    rm -r -f $HOME/$i
  fi
  
  cp -v -i $BASE_DIR/$i $HOME/

done

if [ "$1" = "clean" ]; then
  sh $CONFIG_DIR/nvim/utils/install.sh
  sh $CONFIG_DIR/i3/utils/install.sh
fi

git update-index --skip-worktree $BASE_DIR/kicad/eeschema
git update-index --skip-worktree $BASE_DIR/kicad/pcbnew

echo "install background using this command"
echo "cd i3; ln -s /path/to/background background"
