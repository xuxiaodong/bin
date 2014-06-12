#!/usr/bin/env python
#
# name     : sys-res.py, get cpu percent, mem percent and network I/O statistics
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2014 Jun 12 
# modified : 2014 Jun 12
#

import time
import math
import argparse
import psutil

def get_cpu():
    cpu_percent = psutil.cpu_percent(interval=1, percpu=True)
    avg = sum(cpu_percent) / len(cpu_percent)
    return avg

def get_mem():
    return psutil.virtual_memory()[2]

def get_net():
    prev_net = psutil.net_io_counters()
    prev_send = prev_net[0]
    prev_recv = prev_net[1]

    time.sleep(1)

    cur_net = psutil.net_io_counters()
    cur_send = cur_net[0]
    cur_recv = cur_net[1]

    send = (cur_send - prev_send) / 1024.0
    recv = (cur_recv - prev_recv) / 1024.0

    send = math.ceil(send)
    recv = math.ceil(recv)

    return [send, recv]

def parse_cmd():
    parser = argparse.ArgumentParser(
            description='Get CPU percent, memory percent and network I/O statistics.',
            formatter_class=argparse.ArgumentDefaultsHelpFormatter,
            conflict_handler='resolve')
    parser.add_argument('-c', '--cpu', action='store_true', help='CPU percent')
    parser.add_argument('-m', '--mem', action='store_true', help='memory percent')
    parser.add_argument('-n', '--net', action='store_true', help='network statistics')

    args = parser.parse_args()

    return [args.cpu, args.mem, args.net]

if __name__ == '__main__':
    args = parse_cmd()
    cpu, mem, net = args
    if cpu:
        print(get_cpu())
    if mem:
        print(get_mem())
    if net:
        net_io = get_net()
        net_io = [str(x) for x in net_io]
        net_str = ' '.join(net_io)
        print(net_str)
