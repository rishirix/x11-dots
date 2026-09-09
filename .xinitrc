eval $(dbus-launch --sh-syntax --exit-with-session --exit-with-x11)

xrdb -merge ~/.Xresources

/usr/libexec/polkit-gnome-authentication-agent-1 &
xset b off -dpms s off
pipewire &
easyeffects --hide-window --quit --service-mode &
dwmblocks &
nitrogen --restore &
picom &
dunst &
wal -R

exec dwm
