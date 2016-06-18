#!/usr/bin/env bash
#
# name     : 2bwm-ws.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 May 14
# modified : 2016 Jun 13
#

get_current_ws() {
    # terminal, code, random, coffee, flask, cubes, bug, bomb, plane, beer
    ws_names=('f120' 'f121' 'f074' 'f0f4' 'f0c3' 'f1b3' 'f188' 'f1e2' 'f072' 'f0fc')
    ws_index=$(xdotool get_desktop)
    ws_num=$(($ws_index + 1))
    echo -e "\u${ws_names[$ws_index]} ${ws_num}"
}

get_current_ws
