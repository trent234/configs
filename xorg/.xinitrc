#!/bin/sh
#trent wilson
#corequisites: dwm, xsstate, slock, and goblocks
#goblocks requires go to build

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export GDK_SCALE=2

# statusbar
# exec goblocks 2>&1 >/dev/null &
dwmblocks &

# screen saver/lock
# exec xsidle.sh slock &

# external 4k display check. not playing nice with goblocks,
# may need to run after dwm starts. where is a nice place for that?
#exec video_out_switch.sh &

# this cant be enabled/started the normal way. see docs & the $DISPLAY dependency  
systemctl --user start clipmenud

# window manager
exec dwm
