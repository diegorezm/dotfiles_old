#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# lxsession & 
changer &
screen.sh & 
redshift -l -22.905843:-47.052617 &
xrdb -merge ~/.config/Xresources/Xresources &
discord &
xset r rate 300 50 &
exec qtile start
