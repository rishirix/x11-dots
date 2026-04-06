xrandr --output HDMI-0 --primary --auto --dpi 96 --output DP-4 --auto --dpi 96 --right-of HDMI-0
sh .fehbg &
xrdb -merge .Xresources
picom --daemon --config $HOME/.config/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
easyeffects --hide-window --quit --service-mode &
# nm-applet &
# blueman-applet &
xset b off -dpms s off
udiskie -a -n &
dunst &
dwmblocks &
clipmenud &
flameshot &
battery.sh &
exec dwm
