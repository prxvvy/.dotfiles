from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"

KEYS = [
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "space", lazy.layout.next()),
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),
    ([mod, "control"], "h", lazy.layout.grow_left()),
    ([mod, "control"], "l", lazy.layout.grow_right()),
    ([mod, "control"], "j", lazy.layout.grow_down()),
    ([mod, "control"], "k", lazy.layout.grow_up()),
    ([mod], "n", lazy.layout.normalize()),
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),
    ([mod], "q", lazy.window.kill()),
    ([mod, "shift"], "r", lazy.restart()),
    ([mod, "shift"], "q", lazy.shutdown()),
    (
        [mod, "control"],
        "q",
        lazy.spawn("/home/prxvvy/.config/rofi/powermenu/powermenu.sh"),
    ),
    ([mod], "r", lazy.spawncmd()),
    ([mod, "shift"], "f", lazy.window.toggle_floating()),
    (
        [mod],
        "d",
        lazy.spawn("/home/prxvvy/.config/rofi/launchers/misc/launcher.sh"),
    ),
    ([mod], "b", lazy.spawn("brave")),
    ([mod], "e", lazy.spawn("thunar")),
    ([mod], "Return", lazy.spawn("st")),
    ([mod], "x", lazy.spawn("betterlockscreen -l")),
    (
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer -q set Master 5%+ unmute"),
    ),
    (
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer -q set Master 5%- unmute"),
    ),
    ([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

keys = [Key(key[0], key[1], *key[2:]) for key in KEYS]
