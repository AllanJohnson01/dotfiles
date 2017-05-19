#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources
hsetroot -fill ~/Pictures/wallpaper/current/background.jpg
unclutter -grab -noevents -root &
compton --config ~/.config/compton.conf -b &
#xmobar &

#Window Manager
exec xmonad
#exec franken-dzen
#exec gnome-session
#exec startxfce4
