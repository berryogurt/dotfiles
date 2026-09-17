#!/usr/bin/env bash

set -euo pipefail

python3 -m pip install nautilus-open-any-terminal
nautilus -q
glib-compile-schemas ~/.local/share/glib-2.0/schemas/
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty             # your terminal app, e.g. terminator, gnome-terminal, kitty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t' # GTK accelerator syntax; keep the angle brackets literal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab false              # true or false
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal flatpak system

# add minimize and maximize buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close" || true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true || true
