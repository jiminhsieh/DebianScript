# update
apt-get update

# for C/C++
apt-get install -y gcc g++ 
apt-get install -y terminator
apt-get install -y vim cscope ctags

# for Java
apt-get -y install eclipse eclipse-egit
echo "" >> /etc/apt/sources.list
echo "# Oracle Java" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" \
		>> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" \
		>> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install -y oracle-java6-installer

# developping tool 
apt-get install -y meld git subversion

# Python 3
apt-get install -y python3
