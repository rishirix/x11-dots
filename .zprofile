if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    startx
fi

export ESP_PATH=/boot
export EDITOR=vim

