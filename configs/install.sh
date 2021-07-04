#!/bin/sh

function install_common() {
	cp ./profile ~/.profile
	cp ./xprofile ~/.xprofile
	cp ./mimeapps.list ~/.config/mimeapps.list
	mkdir -p ~/.config/nvim
	cp ./init.vim ~/.config/nvim/init.vim
	mkdir -p ~/.local/share/nvim/site/colors
	cp ./gruvbox.vim ~/.local/share/nvim/site/colors/gruvbox.vim
	cat ./zshrc >> ~/.zshrc
	echo "Install finished"
}

function install_i3() {
	cp ./config_i3 ~/.i3/config
	cp ./Xresources ~/.Xresources
}

function main() {
	read -r -p "Are you sure you want to install ALL OF Yukiteru's config? [y/N] " input

	case $input in
		[yY][eE][sS]|[yY])
			install
			exit 0
			;;

		[nN][oO]|[nN])
			exit 0
			;;

		*)
			exit 1
			;;
	esac
}

main

