/usr/lib/kdeconnectd &
systemctl --user import-environment DISPLAY
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
clipmenud &
dunst &
xmodmap -e "clear lock" &
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock" &
xmodmap -e "keycode 66 = Escape NoSymbol Escape" &


exec i3
