#!/bin/bash

adb shell screencap -p | sed 's/\r$//' > "${1}".png
