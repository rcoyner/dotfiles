#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UNAME=`uname -s`

if [[ "$UNAME" == 'Linux' ]]; then
	mkdir -pv ~/.config/i3/
	mkdir -pv ~/.config/i3status/

    ln -fsv $DIR/Xdefaults ~/.Xdefaults
    ln -fsv $DIR/i3 ~/.config/i3/config
    ln -fsv $DIR/i3status ~/.config/i3status/config
    ln -fsv $DIR/xinitrc ~/.xinitrc
    ln -fsv $DIR/xserverrc ~/.xserverrc
fi

mkdir -pv ~/.vim/backup

ln -fsv $DIR/ackrc ~/.ackrc
ln -fsv $DIR/bash_profile ~/.bash_profile
ln -fsv $DIR/bashrc ~/.bashrc
ln -fsv $DIR/gitconfig ~/.gitconfig
ln -fsv $DIR/screenrc ~/.screenrc
ln -fsv $DIR/tmux.conf ~/.tmux.conf
ln -fsv $DIR/vimrc ~/.vimrc
