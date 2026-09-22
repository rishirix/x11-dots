#!/bin/bash

mkdir -p ~/.config/wal/hooks

source /home/rix/.cache/wal/colors.sh

cat > ~/.cache/wal/dwm.Xresources << EOF
dwm.background:    $color0
dwm.foreground:    $color15
dwm.border:        $color2
dwm.backgroundSel: $color2
dwm.foregroundSel: $color0
dwm.borderSel:     $color1
EOF

cat > ~/.cache/wal/dmenu.Xresources << EOF
dmenu.background:    $color0
dmenu.foreground:    $color15
dmenu.backgroundSel: $color2
dmenu.foregroundSel: $color0
dmenu.backgroundOut: $color1
dmenu.foregroundOut: $color0
EOF

cp $HOME/.cache/wal/dunst.conf $HOME/.config/dunst/dunstrc
pkill dunst && dunst & disown

xrdb -merge /home/rix/.Xresources
kill -HUP $(pidof dwm)

notify-send "pywal" "Colors updated and DWM restarted" 2>/dev/null || true
