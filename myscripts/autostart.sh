#!/bin/bash

# close laptop screen if there is a HDMI
(xrandr | grep -q "HDMI-0 connected") && (xrandr --output eDP-1-1 --off)

picom --config ~/.config/picom/picom.config --experimental-backends -b
# picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b 
#feh --bg-fill ~/Pictures/background/632918.jpg
/bin/bash ./wallpaper.sh &

# HDMI sound
#/usr/bin/start-pulseaudio-x11
#pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo &
#pacmd set-card-profile alsa_card.pci-0000_01_00.1 output:hdmi-stereo &

#/usr/local/bin/electron-ssr &
/usr/local/bin/clash &
/usr/bin/nm-applet &
/bin/bash ~/myscripts/dwm-status.sh &
/usr/bin/xfce4-power-manager &

setxkbmap -option "caps:swapescape"
./inverse-scroll.sh &
