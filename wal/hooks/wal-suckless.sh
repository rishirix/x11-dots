#!/bin/bash

mkdir -p ~/.config/wal/hooks

cp ~/.cache/wal/dwm-colors.h  ~/suckless/dwm/colors.h
cp ~/.cache/wal/dmenu-colors.h ~/suckless/dmenu/colors.h

notify-send "pywal" "Suckless colors updated — ready to recompile" 2>/dev/null || true
