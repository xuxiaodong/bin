#!/usr/bin/env bash
#
# name     : 2bwm-ws.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 May 14
# modified : 2016 May 14
#

get_current_ws() {
    # terminal, code, random, coffee, flask, cubes, bug, bomb, plane
    ws_names=('f120' 'f121' 'f074' 'f0f4' 'f0c3' 'f1b3' 'f188' 'f1e2' 'f072')
    ws_index=$(wmctrl -d | grep '*' | cut -d' ' -f1)
    echo -e "\u${ws_names[$ws_index]}"
}

get_current_ws
