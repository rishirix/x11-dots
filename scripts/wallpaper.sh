#!/bin/bash

IMG_DIR="$HOME/Pictures/walls/"
CHOICE=$( ls ~/Pictures/walls/ | dmenu -l 10 -p "Choose Wallpaper:")

if [ -z "$CHOICE" ];then
	exit 0;
else
	wal -i "$IMG_DIR/$CHOICE" --saturate 0.5 -o ~/.config/wal/hooks/wal-suckless.sh
	source alacritty-pywal.sh
fi
