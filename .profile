PATH=~/.local/npm/bin/:$PATH

dwmblocks &

picom -f &

feh --bg-fill $HOME/.dotfiles/wallpapers/"mikou2".jpg

xset s off && xset -dpms

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
