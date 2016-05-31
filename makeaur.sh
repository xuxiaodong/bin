#!/usr/bin/env bash
#
# name     : makeaur.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 May 8
# modified : 2016 May 14
#

NAME="$1"
BUILD_DIR=~/build

if [[ -z $NAME ]]; then
    echo "Usage: $0 <name>"
    exit 1
fi

[[ -d $BUILD_DIR ]] || mkdir $BUILD_DIR
cd $BUILD_DIR

if [[ ! -d $NAME ]]; then
    git clone https://aur.archlinux.org/${NAME}.git
fi

cd $NAME
makepkg -si

exit 0
