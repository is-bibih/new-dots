#!/bin/bash

echo '# LghtDM GTK+ Configuration

[greeter]
background=/usr/share/pixmaps/wallpaper.jpg
theme-name=vimix-dark-compact-amethyst
icon-theme-name=Papirus
font-name=M+ 1mn
indicators=~language;~clock;~power' > /etc/lightdm/lightdm-gtk-greeter.conf

