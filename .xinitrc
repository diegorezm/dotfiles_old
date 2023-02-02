#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
changer &
redshift -l -22.9605:-45.5407 &
discord &
xset r rate 300 50 &
exec qtile start
