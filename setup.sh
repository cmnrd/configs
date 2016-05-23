#!/bin/bash

sudo pacman -Syu

sudo pacman --needed -S zsh openssh vim htop bmon iotop binutils gcc make scons cmake clang-tools-extra

cd ~

if [[ ! -f .vimrc ]]; then
	ln -s configs/vimrc ~/.vimrc
fi

if [[ ! -f .zshrc ]]; then
	ln -s configs/zshrc ~/.zshrc
fi

touch .zshrc_local
touch .vimrc_local

if [[ -d .vim/bundle/Vundle.vim ]]; then
	git -C .vim/bundle/Vundle.vim pull
	echo "Vundle already installed -> Update"
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Installed Vundle - Run :PluginInstall when starting vim for the first time"
fi
