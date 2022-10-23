#!/bin/bash
(xrandr | grep -q "HDMI-0 connected") && echo "close"
#    xrandr --output eDP-1-1 --off
