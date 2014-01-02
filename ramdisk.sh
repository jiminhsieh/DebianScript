#!/bin/bash
# Plz execute script with how much size you want to allocate

sudo sed -i '$i# ramdisk' /etc/rc.local
sudo sed -i '$imkdir -p /media/ramdisk' /etc/rc.local
sudo sed -i '$imount -t tmpfs -o size=$1M,nr_inodes=0 tmpfs /media/ramdisk' /etc/rc.local
sudo sed -i '$i\\' /etc/rc.local
