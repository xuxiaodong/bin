#!/bin/sh

echo '1500' > /proc/sys/vm/dirty_writeback_centisecs
echo 'auto' > /sys/bus/usb/devices/1-1/power/control
exit 0
