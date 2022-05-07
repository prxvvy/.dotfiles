#! /bin/sh

dwmblocks &

picom -f &

feh --bg-fill $HOME/.dotfiles/wallpapers/"zz68nvd5yfi81".jpg

xset s off && xset -dpms

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
