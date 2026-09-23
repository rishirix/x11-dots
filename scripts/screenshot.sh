#!/bin/bash

SCREENSHOTS="$HOME/Pictures/screenshots/"
CHOICE=$(printf '%s\n' "SCREEN_DSP" "SCREEN_INTERACTIVE" | dmenu -l 2 -p "Screenshot:")
WORD_COUNT="$(ls $SCREENSHOTS | wc -l)"

[[ -z "$CHOICE" ]] && exit 0
case $CHOICE in
	SCREEN_DSP)
		scrot -d 1 "$SCREENSHOTS/%d-%m-%y_\$wx\$h_$((WORD_COUNT+1)).png" --exec 'xclip -selection clipboard -t image/png -i $f && notify-send \"Screenshot saved:\"$f'
		;;
	SCREEN_INTERACTIVE)
		scrot -d 1 --select "$SCREENSHOTS/%d-%m-%y_\$wx\$h_$((WORD_COUNT+1)).png" --exec 'xclip -selection clipboard -t image/png -i $f && notify-send \"Screenshot saved:\"$f'
		;;
	*)
		exit 0
		;;
esac
