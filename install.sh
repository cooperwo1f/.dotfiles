#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIGDIR="$HOME/.config"

echo "homepath = $HOME"
echo "basedir = $BASEDIR"
echo "configdir = $CONFIGDIR"

linkFiles=`find $BASEDIR/* -maxdepth 0 -type d -exec realpath --relative-to=$BASEDIR {} \;`


if [ $1 = 'clean' ]; then
  echo "doing clean install"
fi

mkdir -p $CONFIGDIR

for i in $linkFiles; do
  mv -i -v $BASEDIR/$i $CONFIGDIR/

  if [ $1 = 'clean' ]; then
    rm -r -f $CONFIGDIR/$i
  fi

done

if [ $1 = 'clean' ]; then
  rm -r -f $HOME/.bashrc
  rm -r -f $HOME/.vim
fi

echo "linking .bashrc"
ln -s -v -i $CONFIGDIR/bash/bashrc $HOME/.bashrc

echo "linking .vim"
ln -s -v -i $CONFIGDIR/vim $HOME/.vim

rm -r -f $BASEDIR
