#!/bin/sh
path=$(pwd)

sudo cp pacman.conf /etc/

sudo pacman -Sy --needed xorg git base-devel wget bspwm sxhkd zsh dunst pulseaudio pulseaudio-alsa pavucontrol python python-dbus python-pip rofi kitty scrot xclip ntfs-3g picom hsetroot ttf-font-awesome awesome-terminal-fonts noto-fonts-cjk mpv thunar nomacs 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

[ ! -d $HOME/.config ] && mkdir $HOME/.config
cp -rf config/* $HOME/.config/
cp -rf scripts/ $HOME/scripts/
cp .zshrc $HOME/
sudo cp -rf config-other/picom.conf /etc/xdg/picom.conf

yay -S --needed - < yay-packages.txt

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
