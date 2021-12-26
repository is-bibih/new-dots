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
elif [ x"$@" = x"log off" ]
then
  bspc quit
elif [ x"$@" = x"lock" ]
then
  loginctl lock-session $XDG_CURRENT_SESSION &
  exit 0
fi

echo "lock"
echo "power off"
echo "reboot"
echo "suspend"
echo "log off"

