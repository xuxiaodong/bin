#!/usr/bin/env zsh
#
# name     : shot.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 Jun 26
# modified : 2016 Jun 26
#

IMG=~/picture/desktop_$(date +'%Y%m%d_%H%M').png

import -window root -pause 10 $IMG

exit 0
