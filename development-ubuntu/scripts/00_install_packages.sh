#!/bin/bash
source "/vagrant/scripts/common.sh"

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

setupXfce4 () {
	echo "========================================"
	echo "Install XFCE4"
	apt-get install -y -q xfce4
}

installBrowsers () {
	echo "========================================"
	echo "Installing Firefox.."
	apt-get -y -q install firefox
	echo "Installing Chromium"
	apt-get -y -q install chromium-browser
}

installIDEs(){
	echo "========================================"
	echo "Installing snapd.."
	apt-get install -y -q snapd
	echo "Installing Visual Studio Code.."
	snap install code --classic
	echo "Installing Pycharm.."
	sudo snap install pycharm-community --classic
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

installOthers () {
	echo "========================================"
	echo "Installing git, curl.."
	apt-get -y -q install git curl
}


setupIcons () {
	echo "========================================"
	echo "Installing icons.."
	apt-get -y -q update
	apt-get -y -q install papirus-icon-theme fonts-liberation
}

#
# Execution
#

upgradeBase
installVBGuest
setupXfce4
installBrowsers
installIDEs
installCollaboration
installUtilities
installOthers
#setupDefaults
setupIcons