#!/bin/bash

echo '# LghtDM GTK+ Configuration

[greeter]
#background=/usr/share/pixmaps/nubes2.jpg
theme-name=vimix-dark-compact-amethyst
icon-theme-name=Papirus
#font-name=Iosevka
indicators=~language;~clock;~power' > /etc/lightdm/lightdm-gtk-greeter.conf

