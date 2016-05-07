#!/bin/bash

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
else
    cd $NAME
    makepkg -si
fi
