#! /bin/sh

picom -f &

luastatus -b dwm /home/prxvvy/.local/share/dwm/luastatus/cpu-usage.lua /home/prxvvy/.local/share/dwm/luastatus/mem-usage.lua /home/prxvvy/.local/share/dwm/luastatus/wifi.lua /home/prxvvy/.local/share/dwm/luastatus/alsa.lua /home/prxvvy/.local/share/dwm/luastatus/time-date.lua &

feh --bg-fill $HOME/.dotfiles/wallpapers/"pixelart_house_inside_girl_book_dog".png

xset s off && xset -dpms

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
