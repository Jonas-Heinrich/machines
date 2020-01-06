#!/bin/bash


setupZsh(){
	echo "========================================"
	echo "Installing oh-my-zsh.."

	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) /home/$USER/.oh-my-zsh"

	echo "Install syntax highlighting plugin for oh-my-zsh.."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	echo "Install zsh-autosuggestions for oh-my-zsh.."
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

setupZsh