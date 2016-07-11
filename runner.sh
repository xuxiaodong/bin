#!/usr/bin/env sh
#
# name     : runner.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 May 14
# modified : 2016 Jun 19
#

cmd=$(which rofi)

if [[ -z $cmd ]]; then
    echo "Oops... You need to install rofi."
    exit 1
fi

$cmd -modi "run,window,ssh" \
     -show run

exit 0
