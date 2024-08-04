#!/bin/bash

notify-send "screenrec" "Started recording w/ microphone audio..." -i ~/.scripts/assets/record.png
wl-screenrec -o eDP-1 --audio --audio-device microphone_and_desktop_audio # idk
