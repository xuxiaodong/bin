#!/usr/bin/env bash
#
# name     : 2bwm-batter.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 May 14
# modified : 2016 May 14
#

get_current_bat() {
    # empty, quarter, half, three-quarters, full
    bat_status=('f244' 'f243' 'f242' 'f241' 'f240')
    bat_index=0
    power=$(acpi | cut -d, -f2 | sed 's/%//')
    if [[ $power -gt 0 && $power -le 25 ]]; then
        bat_index=1
    elif [[ $power -gt 25 && $power -le 50 ]]; then
        bat_index=2
    elif [[ $power -gt 50 && $power -le 75 ]]; then
        bat_index=3
    elif [[ $power -gt 75 && $power -le 100 ]]; then
        bat_index=4
    fi
    charg=$(acpi | cut -d' ' -f3 | sed 's/,//')
    if [[ $charg == 'Charging' ]]; then
        # plug
        echo -e "\uf1e6 ${power}%"
    else
        echo -e "\u${bat_status[$bat_index]} ${power}%"
    fi
}

get_current_bat
