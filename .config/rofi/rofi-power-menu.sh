#!/bin/bash

if [ x"$@" = x"power off" ]
then
  systemctl poweroff
elif [ x"$@" = x"reboot" ]
then
  systemctl reboot
elif [ x"$@" = x"suspend" ]
then
  systemctl suspend
elif [ x"$@" = x"log out" ]
then
  bspc quit
elif [ x"$@" = x"lock" ]
then
  loginctl lock-session $XDG_CURRENT_SESSION &
  exit 0
fi

echo -e "lock\0icon\x1fsystem-lock-screen"
echo -e "power off\0icon\x1fsystem-shutdown"
echo -e "reboot\0icon\x1fsystem-reboot"
echo -e "suspend\0icon\x1fprocess-stop"
echo -e "log out\0icon\x1fsystem-log-out"

