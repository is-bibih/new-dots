#!/bin/sh

killall mopidy
while pgrep -u $UID -x mopidy >/dev/null; do sleep 1; done
mopidy
