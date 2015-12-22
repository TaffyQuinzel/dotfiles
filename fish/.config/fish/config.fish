if status --is-login
    set -xg PANEL_FIFO /tmp/panel-fifo
    set -xg XDG_DATA_HOME $HOME/.data
    set -xg MOZ_PLUGIN_PATH /usr/lib/mozilla/plugins
    set -xg MAIL /var/spool/mail/$USER
    set PATH $PATH /usr/local/sbin /usr/local/bin /usr/bin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl
    set -xg LANG en_GB.UTF-8
    set -xg XDG_CONFIG_HOME $HOME/.config
    set -xg XDG_CACHE_HOME $HOME/.cache
    set -xg _ /usr/bin/printenv
    set -xg EDITOR emacs
    set -xg VISUAL emacs
    set -xg BROWSER firefox
    set -xg JAVA_HOME /usr/lib/jvm/java-7-openjdk/jre
    set -xg CATALINA_HOME /opt/tomcat
    set -xg SSH_AUTH_SOCK /tmp/ssh-agent.socket
end

#remove welcome message
set --erase fish_greeting

#aliases 
alias please='sudo'
alias update='~/scripts/update-system'
alias installs='~/scripts/aur-install'
alias install='sudo pacman -S'
alias uninstall='sudo pacman -Rns'
alias search='pacman -Ss'
alias searchs='~/scripts/search-repos'
alias paclear='sudo pacman -Sc'
alias svim='sudo vim'
alias logout='exit'
set group (groups | awk '{ print $1 }')
alias mount="sudo mount -o uid=$USER,gid=$group,fmask=113,dmask=002"
alias umount='sudo umount'

#make the shell follow the path of ranger
function rangercd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

#the second best thing ever
function aoeu -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

#THE BEST THING EVER!!!!!!!!!!!!!
#fish_vi_mode
#fish_user_key_bindings
# bind -e -m insert s delete-char force-repaint
#vi keybindings
# function fish_user_key_bindings
# 	bind -M insert \cr 'echo "test"'
# 	bind -M normal \cx forward-char
# end
# bind -k ppage history-search-forward
# set -g fish_key_bindings fish_vi_key_bindings
# bind -M normal \cs forward-char
# bind -M insert n backward-char
# bind -M insert \ck kill-whole-line force-repaint



#powerline-daemon -q
#set fish_function_path $fish_function_path "/usr/lib/python3.4/site-packages/powerline/bindings/fish"
#powerline-setup
