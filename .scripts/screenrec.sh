#!/bin/bash

notify-send "screenrec" "Started recording..." -i ~/.scripts/assets/record.png
wl-screenrec -o eDP-1 --audio --audio-device alsa_output.pci-0000_00_1f.3.analog-stereo.monitor # idk
