#!/bin/bash
pactl load-module module-null-sink sink_name=microphone_and_desktop_audio
pactl load-module module-loopback source=alsa_output.pci-0000_00_1f.3.analog-stereo.monitor sink=microphone_and_desktop_audio
pactl load-module module-loopback source=alsa_output.pci-0000_00_1f.3.analog-stereo sink=microphone_and_desktop_audio
