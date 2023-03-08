#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
lxsession &
changer &
redshift -l -22.905843:-47.052617 &
discord &
steam &
xset r rate 300 50 &
exec qtile start
