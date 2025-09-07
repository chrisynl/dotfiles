#!/bin/bash

# refresh rate
(xrandr --output HDMI-0 --mode 2560x1440 --rate 144) && (xrandr | grep -q "HDMI-0 connected") && (xrandr --output eDP-1-1 --off)
# close laptop screen if there is a HDMI

sleep 3

picom --config ~/.config/picom/picom.config &
# picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b 
#feh --bg-fill ~/Pictures/background/632918.jpg
/bin/bash ./wallpaper.sh &

# HDMI sound
#/usr/bin/start-pulseaudio-x11
#pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo &
#pacmd set-card-profile alsa_card.pci-0000_01_00.1 output:hdmi-stereo &

#/usr/local/bin/electron-ssr &
# /usr/local/bin/clash &
/usr/bin/nm-applet &
# /bin/bash ./dwm-status.sh &
/usr/bin/xfce4-power-manager &

setxkbmap -option "caps:swapescape" &
./inverse-scroll.sh &

# sleep 5s to let wifi has time to connect
# sleep 5
# /usr/local/bin/cfw &
/usr/bin/clash-verge &
