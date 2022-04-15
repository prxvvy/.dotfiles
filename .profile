PATH=~/.local/npm/bin/:$PATH

dwmblocks &

picom -f &

feh --bg-fill $HOME/.dotfiles/wallpapers/"gaming-wallpaper-200601203754441920x1080".jpg

xset s off && xset -dpms

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
