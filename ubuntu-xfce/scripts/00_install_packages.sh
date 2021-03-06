#!/bin/bash
source "/vagrant/scripts/common.sh"

#
# Base Packages
#

upgradeBase () {
	echo "========================================"
	echo "Updating base system.."
	apt-get -y -q update
	apt-get -y -q upgrade
}

installVBGuest () {
	echo "========================================"
	echo "Installing VB Guest.."
	apt-get install -y -q linux-headers-$(uname -r) build-essential dkms
	echo "Install VB Guest Additions.."
	apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}

installOthers () {
	echo "========================================"
	echo "Installing git, curl.."
	apt-get -y -q install \
		git \
		curl \
		rxvt-unicode \
		python3-pip \
		unzip
}

installZsh(){
	echo "========================================"
	echo "Installing zsh.."
	apt-get install -y -q zsh
}

#
# GUI
#

installXfce4 () {
	echo "========================================"
	echo "Installing XFCE4.."
	apt-get install -y -q xfce4

	echo "Installing additional packages for dXFCE4.."
	
	echo "Installing whiskermenu.."
	add-apt-repository ppa:gottcode/gcppa
    apt-get update
	apt-get -y -q install xfce4-whiskermenu-plugin
	
	echo "Installing arc-theme.."
	add-apt-repository ppa:noobslab/themes
	apt-get update
	apt-get -y -q install arc-theme
	
	echo "Installing Papirus icons, fonts.."
	apt-get -y -q install papirus-icon-theme fonts-liberation

	echo "Installing cursor theme.."
	add-apt-repository ppa:/dyatlov-igor/la-capitaine
	apt update
	apt-get -y -q install la-capitaine-cursor-theme

	echo "Installing fonts.."
	apt-get install -y -q fonts-hack
}

installI3(){
	echo "========================================"
	echo "Installing i3.."
	apt-get install -y -q i3

	echo "Installing i3 gaps.."
	sudo apt install -y -q libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
	                       libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
						   libstartup-notification0-dev libxcb-randr0-dev \
						   libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
						   libxcb-xkb-dev libxkbcommon-dev \
						   libxkbcommon-x11-dev autoconf xutils-dev libtool \
						   automake
	
	cd /tmp
	git clone https://www.github.com/Airblader/i3 i3-gaps
	cd i3-gaps
	git checkout gaps && git pull
	autoreconf --force --install
	rm -rf build
	mkdir build
	cd build
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	make
	make install
}

#
# Languages
#

installGolang() {
	echo "========================================"
	echo "Installing golang.."
	wget -O /tmp/go.tar.gz https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
	tar -C /usr/local -xzf /tmp/go.tar.gz

	# Make available to zsh
	echo '' >> /home/$USER/.zshrc
	echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/$USER/.zshrc
}

installNode() {
	echo "========================================"
	echo "Installing node and npm.."
	apt-get install nodejs
	curl -L https://npmjs.org/install.sh | sh
}

#
# Editors
#

installVSCode() {
	echo "========================================"
	apt-get install -y -q snapd
	echo "Installing Visual Studio Code.."
	snap install code --classic
}

installJetbrainsPycharm() {
	echo "========================================"
	apt-get install -y -q snapd
	echo "Installing Pycharm.."
	sudo snap install pycharm-community --classic
}

installJetbrainsDatagrip() {
	echo "========================================"
	apt-get install -y -q snapd
	echo "Installing Datagrip.."
	sudo snap install datagrip --classic
}

#
# Applications
#

installBrowsers() {
	echo "========================================"
	echo "Installing Firefox.."
	apt-get -y -q install firefox
	echo "Installing Chromium"
	apt-get -y -q install chromium-browser
}

installCollaboration(){
	echo "========================================"
	echo "Installing snapd.."
	apt-get install -y -q snapd
	echo "Installing Slack.."
	snap install slack --classic
	echo "Installing Skype.."
	snap install skype --classic
}

installUtilities(){
	echo "========================================"
	echo "Installing snapd.."
	apt-get install -y -q snapd
	echo "Installing Postman.."
	snap install postman
}

#
# Infrastructure
#

installTerraform(){
	echo "========================================"
	echo "Installing Terraform.."
	curl https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip > /tmp/terraform.zip
	unzip /tmp/terraform.zip
	mv -f terraform /usr/bin/terraform
}

installDocker(){
	echo "========================================"
	echo "Installing Docker.."
	apt-get remove docker docker-engine docker.io containerd runc -y
	apt-get update
	apt-get install \
	    apt-transport-https \
	    ca-certificates \
	    curl \
	    gnupg-agent \
	    software-properties-common -y

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	add-apt-repository \
	    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io -y
	docker run hello-world
}

installDockerCompose(){
	curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
}

#
# Execution
#

# Base packages
upgradeBase
#installVBGuest
#installOthers
#installZsh

# GUI
#installXfce4
#installI3

# Languages
#installGolang
#installNode

# Editors
#installVSCode
#installJetbrainsPycharm
#installJetbrainsDatagrip

# Applications
#installBrowsers
#installCollaboration
#installUtilities

# Infrastructure
#installTerraform
#installDocker
#installDockerCompose