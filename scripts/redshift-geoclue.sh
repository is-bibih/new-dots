#!/bin/bash

# set in /etc/geoclue/geoclue.conf
# url=https://location.services.mozilla.com/v1/geolocate?key=geoclue

echo "[redshift]
allowed=true
system=false
users=" >> /etc/geoclue/geoclue.conf

