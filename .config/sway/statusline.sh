#!/bin/bash

# time
time_str=$(date +'%I:%M:%S%P')

# date
date_str=$(date +'%Y-%m-%d')

# batteries
bat_str=$(printf "%s" 'b1:' $(cat /sys/class/power_supply/BAT0/capacity) ' ' 'b2:' $(cat /sys/class/power_supply/BAT1/capacity) )

echo $date_str $time_str $bat_str
