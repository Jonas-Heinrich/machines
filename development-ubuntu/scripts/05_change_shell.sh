#!/bin/bash


changeShell(){
	chsh -s $(which zsh) vagrant
}

changeShell