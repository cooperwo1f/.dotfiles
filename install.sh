#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIGDIR="$HOME/.config"

echo "homepath = $HOME"
echo "basedir = $BASEDIR"
echo "configdir = $CONFIGDIR"

linkFiles=`find $BASEDIR/* -maxdepth 0 -type d -exec realpath --relative-to=$BASEDIR {} \;`

mkdir -p $CONFIGDIR

for i in $linkFiles; do
  echo "moving $i"
  mv $BASEDIR/$i $CONFIGDIR/$i
done

echo "linking .bashrc"
ln -s -v -i $CONFIGDIR/bash/bashrc $HOME/.bashrc

echo "linking .vim"
ln -s -v -i $CONFIGDIR/vim $HOME/.vim

rm -r $BASEDIR
