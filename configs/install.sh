#!/bin/sh

function install() {
	cp ./config_i3 ~/.i3/config
	cp ./profile ~/.profile
	cp ./xprofile ~/.xprofile
	cp ./Xresources ~/.Xresources
	cp ./mimeapps.list ~/.config/mimeapps.list
	mkdir -p ~/.config/nvim
	cp ./init.vim ~/.config/nvim/init.vim
	mkdir -p ~/.local/share/nvim/site/colors
	cp ./gruvbox.vim ~/.local/share/nvim/site/colors/gruvbox.vim
	echo "Install finished"
	exit 0
}

function escape() {
	exit 0
}

read -r -p "Are you sure you want to install ALL OF Yukiteru's config? [y/N] " input

case $input in
    [yY][eE][sS]|[yY])
		echo "Yes"
		;;

    [nN][oO]|[nN])
		escape
       	;;

    *)
		escape
		;;
esac

