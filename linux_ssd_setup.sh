#!/bin/sh
#
# reference from https://sites.google.com/site/easylinuxtipsproject/ssd
#
# Reserve 10 percent for overprovisioning

# noatime
sudo sed -i 's/rw/noatime,nodiratime,discard/g' /etc/fstab

# TRIM
sudo sed -i '$i# TRIM' /etc/rc.local
sudo sed -i '$ifstrim -v /' /etc/rc.local
sudo sed -i '$i\\' /etc/rc.local

# TRIM periodically
while true; do
        read -p "Is your computer always on?[y/n]" yn
        case $yn in 
                [Yy]* ) sudo echo 'fstrim -v /' | sudo tee -a /etc/cron.daily/trim;
                        sudo chmod +x /etc/cron.daily/trim; 
                        break;;
                [Nn]* ) echo 'Do nothing!';
                        break;;
                * ) echo 'Please answer Y/y or N/n.';;
        esac
done

# Change Disk I/O Scheduler
function replace() {
	sudo sed -i "s/$1/elevator=deadline quiet splash/g" /etc/default/grub
	sudo update-grub2	
}

if grep '"quiet"' /etc/default/grub; then
	string="quiet"
	replace $string 
elif grep '"quiet splash"' /etc/default/grub; then 
	string="quiet splash"
	replace $string
else
	echo -e '### "Nothing Replace!" ###'
fi

# put temp to RAM
sudo echo '' | sudo tee -a /etc/fstab
sudo echo '# tmp in ram' | sudo tee -a /etc/fstab
sudo echo 'tmpfs   /tmp            tmpfs   defaults,noatime,mode=1777      0       0' | sudo tee -a /etc/fstab
sudo echo 'tmpfs   /var/spool      tmpfs   defaults,noatime,mode=1777      0       0' | sudo tee -a /etc/fstab
sudo echo 'tmpfs   /var/tmp        tmpfs   defaults,noatime,mode=1777      0       0' | sudo tee -a /etc/fstab

# turn off swap space 
sudo sed -i '$i# turn off swap space for SSD' /etc/rc.local
sudo sed -i '$iswapoff -a' /etc/rc.local
sudo sed -i '$i\\' /etc/rc.local
