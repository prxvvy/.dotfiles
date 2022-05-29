#! /bin/sh

slstatus &

# luastatus -b dwm /home/prxvvy/.local/share/dwm/luastatus/cpu-usage.lua /home/prxvvy/.local/share/dwm/luastatus/mem-usage.lua /home/prxvvy/.local/share/dwm/luastatus/wifi.lua /home/prxvvy/.local/share/dwm/luastatus/alsa.lua /home/prxvvy/.local/share/dwm/luastatus/time-date.lua &

feh --bg-fill $HOME/.dotfiles/wallpapers/"4b937052-d970-481c-9c7f-e56aae23d4ef".png

xset s off && xset -dpms

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
 
dunst -conf $HOME/.config/dunst/dunstrc &
picom -f &
