# update
sudo apt-get update

# for C/C++
sudo apt-get install -y gcc g++ 
sudo apt-get install -y terminator
sudo apt-get install -y vim cscope ctags

# for Java
sudo apt-get -y install eclipse eclipse-egit
sudo echo "" | sudo tee -a /etc/apt/sources.list
sudo echo "# Oracle Java" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" \
                | sudo tee -a /etc/apt/sources.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" \
	        | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
sudo apt-get install -y oracle-java6-installer oracle-java7-installer

# developping tool 
sudo apt-get install -y meld git subversion

# Python 3
sudo apt-get install -y python3
# PyCscope
git clone https://github.com/portante/pycscope.git
sudo python pycscope/setup.py install 
rm -r pycscope

# vgod's vimrc
wget -O - https://raw.github.com/vgod/vimrc/master/auto-install.sh | sh
