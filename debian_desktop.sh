#!/bin/bash
##################################
#  Debian 7 Alternative Desktop  #
#  1. Cinnamon                   #
#  2. Mate                       #
##################################

echo " Which Desktop you want to install?"
PS3='Please enter your choice[1-3]: '

select option in "cinnamon" "mate" "quit"; do
	sudo echo "" | sudo tee -a /etc/apt/sources.list
	case $option in 
		"cinnamon" ) 
			sudo echo "# cinnamon desktop" | sudo tee -a /etc/apt/sources.list
        		sudo echo 'deb http://packages.linuxmint.com/ debian main import \
        		        backport upstream romeo' | sudo tee -a /etc/apt/sources.list
        		sudo apt-get update
        		sudo apt-get install linuxmint-keyring
        		sudo apt-get install cinnamon cinnamon-session cinnamon-settings
			break;;
		
		"mate" )	
			echo "# mate desktop" | sudo tee -a /etc/apt/sources.list
			echo "deb http://repo.mate-desktop.org/debian wheezy main" \
			        | sudo tee -a /etc/apt/sources.list
        		sudo apt-get update
        		apt-get --yes --quiet --allow-unauthenticated install mate-archive-keyring
        		sudo apt-get update
        		sudo apt-get install -y mate-core mate-desktop-environment \
        		        mate-desktop-environment-extra
			break;;
		"quit" )
			break;;
	esac
done
