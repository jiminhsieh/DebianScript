#!/bin/bash

# variables START
ZULU_JDK=zulu8.28.0.1-jdk8.0.163-linux_amd64.deb
codename=$(lsb_release -da | awk 'FNR == 4 { print $2 }')
# variables END

PS3='Please which you use: '
options=("Docker", "LXC", "Bare Machine")
select option in "${options[@]}" 
do 
	case $option in 
			"Docker")
				is_container=true
				break
				;;
			"LXC")
				is_container=true
				break
				;;
			"Bare Machine")
				is_container=false
				break
				;;
			"Quit")
				exit 0
				;;
			*)
				break
				;;
	esac
done

if [ 'is_container' = true ]; then
	sudo echo "Asia/Taipei" | sudo tee -a /etc/timezone && \
    	sudo dpkg-reconfigure -f noninteractive tzdata && \
    	sudo sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    	sudo echo 'LANG="en_US.UTF-8"' | sudo tee -a /etc/default/locale && \
    	sudo echo 'LANGUAGE="en_US:en"' | sudo tee -a /etc/default/locale && \
    	sudo dpkg-reconfigure --frontend=noninteractive locales && \
    	sudo update-locale LANG=en_US.UTF-8
fi

sudo -s apt install -y vim net-tools screen wget build-essential curl git python-setuptools iftop htop iotop

wget http://cdn.azul.com/zulu/bin/${ZULU_JDK}
sudo dpkg -i ${ZULU_JDK}
sudo apt --fix-broken -y install
rm ${ZULU_JDK}

# Linuxbrew
yes '' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.profile
echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >>~/.profile
echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >>~/.profile
source ~/.profile

brew install gcc sbt scala gradle maven vim git fish

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh
sudo -s usermod -aG docker $(whoami)

# VirtualBox
if [ 'is_container' = false ]; then
	sudo echo "deb http://download.virtualbox.org/virtualbox/debian ${codename} contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
	sudo apt-get update
	sudo apt-get install virtualbox-5.1
fi

if [ 'is_container' = false ]; then
	wget https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.deb
	sudo dpkg -i vagrant_2.0.2_x86_64.deb
fi

./rc/bash_profile.sh
./rc/screenrc.sh
./rc/vimrc_basic.sh
