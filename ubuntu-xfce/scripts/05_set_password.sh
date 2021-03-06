#!/bin/bash
source "/vagrant/scripts/common.sh"

function changePassword {
	echo "Changing password of ${USER} user.."
	apt-get -qq install expect 
	tee ~/chgPasswd.sh << EOF
	set timeout 20
	spawn sudo passwd ${USER}
	expect "Enter new UNIX password:" {send "${USER}\\r"}
	expect "Retype new UNIX password:" {send "${USER}\\r"}
	interact
EOF
	expect ~/chgPasswd.sh
	echo "Finished ${USER} user setup"
}

changePassword