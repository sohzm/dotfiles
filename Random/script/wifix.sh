#!/bin/sh

bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | dmenu -fn 'JetBrains Mono:size=16' -p "Select Wifi: " -l 27 | cut -d' ' -f1)
nmcli device wifi connect $bssid
