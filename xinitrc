#!/bin/sh
while true; do
  xsetroot -name "$( date +"%c" )::$(mpc current)"
  sleep 1m
done &

#. /etc/X11/xinit/xinitrc
xrdb -load ~/.Xresources

exec dwm
