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

installOthers () {
	echo "========================================"
	echo "Installing git, curl.."
	apt-get -y -q install git curl rxvt-unicode python3-pip
}

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

installZsh(){
	echo "========================================"
	echo "Installing zsh.."
	apt-get install -y -q zsh
}

#
# Execution
#

upgradeBase
installVBGuest
installOthers
installXfce4
installBrowsers
installIDEs
installCollaboration
installUtilities
installZsh