#!/usr/bin/env python
#
# name     : sys-res.py, get cpu and mem percent
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2014 Jun 12 
# modified : 2014 Jun 12
#

import argparse
import psutil

def get_cpu():
    cpu_percent = psutil.cpu_percent(interval=1, percpu=True)
    avg = sum(cpu_percent) / len(cpu_percent)
    return avg

def get_mem():
    return psutil.virtual_memory()[2]

def parse_cmd():
    parser = argparse.ArgumentParser(
            description='Get CPU and memory percent.',
            formatter_class=argparse.ArgumentDefaultsHelpFormatter,
            conflict_handler='resolve')
    parser.add_argument('-c', '--cpu', action='store_true', help='CPU percent')
    parser.add_argument('-m', '--mem', action='store_true', help='memory percent')

    args = parser.parse_args()

    return [args.cpu, args.mem]

if __name__ == '__main__':
    args = parse_cmd()
    cpu, mem = args
    if cpu:
        print(get_cpu())
    if mem:
        print(get_mem())
