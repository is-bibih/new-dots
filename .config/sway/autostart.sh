#!/bin/sh

# env variables (with systemd)
export $(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# notification daemon
~/.config/dunst/launch.sh

# input method
fcitx5 -d --replace

# gamma settings (color temperature)
wlsunset -l $(curl --fail https://ipapi.co/latitude) -L $(curl --fail https://ipapi.co/longitude)

