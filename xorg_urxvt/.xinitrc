# disable beep
xset -b
# disable sleep and screen blanking
xset s off -dpms 
# merge custom X resources
xrdb -merge ~/.Xresources
# font stuff
xset +fp /usr/share/fonts/local/
xset fp rehash
# set xdg config for custom awesome
# export XDG_CONFIG_HOME=${HOME}/.config/

# wallpaper
# feh --bg-fill ~/images/Sky-Clouds-Background-28.jpg

# autostart Copy
#CopyAgent &

# autostart urxvt
if [ $(pgrep -cx urxvtd) -lt 1 ] ; then
	urxvtd &
fi

# mouse pointer
xsetroot -cursor_name left_ptr&

# start window manager
exec wmii
