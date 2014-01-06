#!/bin/bash
# Plz execute script with how much size you want to allocate
echo -n "How much ramdisk size you want assign[MB]? "
read size 

sudo sed -i '$i# ramdisk' /etc/rc.local
sudo sed -i '$imkdir -p /media/ramdisk' /etc/rc.local
sudo sed -i '$imount -t tmpfs -o size='"$size"'M,nr_inodes=0 tmpfs /media/ramdisk' /etc/rc.local
sudo sed -i '$i\\' /etc/rc.local
