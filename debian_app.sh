# update
apt-get update

# for Chinese Display
apt-get -y install ttf-arphic-bkai00mp ttf-arphic-bsmi00lp \
			ttf-arphic-gbsn00lp ttf-arphic-gbsn00lp 

# for Chinese Input Method
apt-get -y install scim scim-chewing 

# for Virtual Box USB subsystem
apt-get install -y virtualbox virtualbox-dkms
user=$(echo "$USER")
usermod -a -G vboxusers $user

# for Logitech Trackball, it's for left-handed people
apt-get install -y xinput

echo "" >> ~/.profile 
echo "# xinput for Logitech USB Trackball" >> ~/.profile
echo "xinput set-prop "Logitech USB Trackball" \
		"Evdev Middle Button Emulation" 1" >> ~/.profile
echo "xinput set-prop "Logitech USB Trackball" \
		"Evdev Wheel Emulation" 1" >> ~/.profile
echo "xinput set-prop "Logitech USB Trackball" \
		"Evdev Wheel Emulation Button" 9" >> ~/.profile
echo "xinput set-prop "Logitech USB Trackball" \
		"Evdev Wheel Emulation Axes" 6 7 4 5" >> ~/.profile

# for Chrome Browser only x64
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb 
rm google-chrome-stable_current_amd64.deb

# Some of Software
apt-get -y install quicksynergy gemanx-gtk2 mintinstall audacious vlc \
			emesene unetbootin proftpd \
			unrar-free xrdp filezilla  remmina\
