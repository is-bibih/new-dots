#!/bin/bash

mkdir /etc/pacman.d/hooks
echo "[Trigger]
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
When = PostTransaction
Exec = /bin/sh -c '/usr/bin/pacman -Qqe > /home/vivi/pkglist.txt'" > /etc/pacman.d/hooks/pkglist.hook
