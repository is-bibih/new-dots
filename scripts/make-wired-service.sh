#!/bin/bash

echo "[Unit]
Description=wired-notify deamon
After=lightdm.service

[Install]
WantedBy=default.target

[Service]
ExecStart=/bin/bash -c /bin/wired -r
RestartSec=10
Restart=always" > /usr/lib/systemd/user/wired_notify.service
