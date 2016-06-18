#!/usr/bin/env bash
#
# name     : find-debshot.sh, find debian package snapshot
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 Jun 18
# modified : 2016 Jun 18
#

NAME="$1"
VER="$2"
URL="http://snapshot.debian.org/package/${NAME}/"

if [[ -z $NAME ]]; then
    echo "Usage: $0 <package>"
    exit 1
fi

if [[ -n $VER ]]; then
    VER=$(echo $VER|sed -e 's/\+b[0-9]//')
    URL+="$VER/"
fi

firefox --new-tab $URL

exit 0
