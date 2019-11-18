#!/bin/bash
source "/vagrant/scripts/common.sh"

setupDotfiles (){
	echo "========================================"
	echo "Cloning dotfiles for Jonas Heinrich.."
	git clone --bare https://github.com/Jonas-Heinrich/dotfiles.git ~/.dotfiles

	git --git-dir=/home/$USER/.dotfiles/ --work-tree=/home/$USER checkout --force
}

setupDotfiles