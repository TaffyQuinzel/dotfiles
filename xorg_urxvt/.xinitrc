# disable beep
xset -b
# disable sleep and screen blanking
xset s off -dpms 
# merge custom X resources
xrdb -merge ~/.Xresources
# font stuff
xset +fp /usr/share/fonts/local/
xset fp rehash

# autostart urxvt
if [ $(pgrep -cx urxvtd) -lt 1 ] ; then
	urxvtd &
fi

# mouse pointer
xsetroot -cursor_name left_ptr&

# start window manager
exec wmii
