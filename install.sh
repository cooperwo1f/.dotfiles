#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIGDIR="$HOME/.config"

sudo echo "got root"

echo "homepath = $HOME"
echo "basedir = $BASEDIR"
echo "configdir = $CONFIGDIR"

linkFolders=`find $BASEDIR/* -maxdepth 0 -type d -exec realpath --relative-to=$BASEDIR {} \;`
linkFiles=`find $BASEDIR/. -maxdepth 1 -type f -name ".[^.]*" -exec realpath --relative-to=$BASEDIR {} \;`

if [ "$1" = "clean" ]; then
  echo "doing clean install"
fi

mkdir -p $CONFIGDIR

echo "linking folders"
for i in $linkFolders; do
  if [ "$1" = "clean" ]; then
    rm -r -f $CONFIGDIR/$i
  fi
  
  ln -s -v -i $BASEDIR/$i $CONFIGDIR/

done

echo "linking files"
for i in $linkFiles; do
  if [ "$i" = ".gitignore" ]; then
    continue
  fi

  if [ "$1" = "clean" ]; then
    rm -r -f $HOME/$i
  fi
  
  cp -v -i $BASEDIR/$i $HOME/

done

echo "installing nvim"
sh $HOME/.config/nvim/utils/install.sh
