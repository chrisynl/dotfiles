#!/bin/bash

#/usr/bin/amixer set Master toggle
pactl list sinks | grep -q Mute:.no && pactl set-sink-mute 0 1 || pactl set-sink-mute 0 0
