randomxinputvarthatimade=$(xinput list | grep -i "touchpad" | awk '{print $6}' | cut -c4-5 | xargs)
xinput set-prop ${randomxinputvarthatimade} 'libinput Tapping Enabled' 1
xinput set-prop ${randomxinputvarthatimade} 'libinput Natural Scrolling Enabled' 1
