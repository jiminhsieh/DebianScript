# update
sudo apt-get update

# for Chinese Display
sudo apt-get -y install ttf-arphic-bkai00mp ttf-arphic-bsmi00lp \
			ttf-arphic-gbsn00lp ttf-arphic-gbsn00lp 

# for Chinese Input Method
sudo apt-get -y install scim scim-chewing 

# for Virtual Box USB subsystem
sudo apt-get install -y virtualbox virtualbox-dkms
user=$(echo "$USER")
sudo usermod -a -G vboxusers $user

# for Logitech Trackball, it's for left-handed people
sudo apt-get install -y xinput

echo "" >> ~/.profile 
echo '# xinput for Logitech USB Trackball' >> ~/.profile
echo 'xinput set-prop "Logitech USB Trackball" \
		"Evdev Middle Button Emulation" 1' >> ~/.profile
echo 'xinput set-prop "Logitech USB Trackball" \
		"Evdev Wheel Emulation" 1' >> ~/.profile
echo 'xinput set-prop "Logitech USB Trackball" \
		"Evdev Wheel Emulation Button" 9' >> ~/.profile
echo 'xinput set-prop "Logitech USB Trackball" \
		"Evdev Wheel Emulation Axes" 6 7 4 5' >> ~/.profile

# Chrome Browser, it would depend on your CPU type to download suited package
CpuType=$(uname -m)

function chrome() {
	echo "This is $1 System!!!"
	wget -c https://dl.google.com/linux/direct/$2
	sudo dpkg -i $2
	rm $2
}

if [ $CpuType == "x86_64" ]; then
	chrome $CpuType google-chrome-stable_current_amd64.deb
else
	chrome $CpuType google-chrome-stable_current_i386.deb
fi

# Some of Software
sudo apt-get -y install quicksynergy gemanx-gtk2 mintinstall audacious vlc \
			emesene unetbootin proftpd gnome-disk-utility\
			unrar-free xrdp filezilla  remmina\
