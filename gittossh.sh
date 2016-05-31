#!/usr/bin/env sh
#
# name     : gittossh.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 May 14
# modified : 2016 May 14
#

sed -i 's!git://github.com/!git@github.com:!' .git/config
