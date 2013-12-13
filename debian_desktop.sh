##################################
#  Debian 7 Alternative Desktop  #
#  1. Cinnamon                   #
#  2. Mate                       #
##################################

echo " Which Desktop you want to install?"
PS3='Please enter your choice[1-3]: '

select option in "cinnamon" "mate" "quit"; do
	echo "" >> /etc/apt/sources.list
	case $option in 
		"cinnamon" ) 
			echo "# cinnamon desktop" >> /etc/apt/sources.list
        		echo 'deb http://packages.linuxmint.com/ debian main import backport upstream romeo' \
                		>> /etc/apt/sources.list
        		apt-get update
        		apt-get install linuxmint-keyring
        		apt-get install cinnamon cinnamon-session cinnamon-settings
			break;;
		
		"mate" )	
			echo "# mate desktop" >> /etc/apt/sources.list
			echo "deb http://repo.mate-desktop.org/debian wheezy main" >> /etc/apt/sources.list
        		apt-get update
        		apt-get install -y mate-archive-keyring
        		apt-get update
        		apt-get install -y mate-core mate-desktop-environment mate-desktop-environment-extra
			break;;
		"quit" )
			break;;
	esac
done
