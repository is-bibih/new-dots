#!/bin/bash

bspc subscribe desktop_layout | while read -r Event
do
  Desktop=$(echo "$Event" | awk '{print $3}')
  State=$(echo "$Event" | awk '{print $4}')
  if [ "$State" = "monocle" ]; then 
    bspc query -N -d $Desktop | while read -r Node
    do
      xprop -id $Node -f _PICOM_ROUNDED 32c -set _PICOM_ROUNDED 1
    done
  elif [ $(bspc config window_gap) -gt 0 ]; then
    bspc query -N -d $Desktop | while read -r Node
    do
      xprop -id $Node -remove _PICOM_ROUNDED
    done
  fi
done &

# thank u person from https://www.reddit.com/r/bspwm/comments/hqt1r3/is_there_a_way_to_disable_picom_rounded_borders/

