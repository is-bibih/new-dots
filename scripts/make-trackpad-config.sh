#!/bin/bash

echo 'Section "InputClass"
	Identifier "devname"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "NaturalScrolling" "true"
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf

