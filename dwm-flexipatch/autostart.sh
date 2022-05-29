#! /bin/sh

dwmblocks &

picom -f &

# luastatus -b dwm /home/prxvvy/.local/share/dwm/luastatus/cpu-usage.lua /home/prxvvy/.local/share/dwm/luastatus/mem-usage.lua /home/prxvvy/.local/share/dwm/luastatus/wifi.lua /home/prxvvy/.local/share/dwm/luastatus/alsa.lua /home/prxvvy/.local/share/dwm/luastatus/time-date.lua &

feh --bg-fill $HOME/.dotfiles/wallpapers/"gruv-simplistic-ngo".png

xset s off && xset -dpms

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
 
dunst -conf $HOME/.config/dunst/dunstrc &
