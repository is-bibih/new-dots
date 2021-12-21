#!/bin/bash

BG_DIR=$HOME/.wallpapers/

BG_FILE=$(find $BG_DIR -type f | shuf -n 1)

# set bg
feh --bg-fill --no-fehbg $BG_FILE

# cache image for lockscreen
betterlockscreen -u $BG_FILE --fx blur > lock.log

