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

# autostart gpg-agent
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh

# ssh agent askpass stuff
export SSH_ASKPASS=ssh-askpass

# mouse pointer
xsetroot -cursor_name left_ptr&

# start window manager
exec wmii
