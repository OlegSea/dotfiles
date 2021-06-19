#!/bin/sh
path=$(pwd)

sudo pacman -S --needed xorg git base-devel wget bspwm sxhkd zsh pulseaudio pulseaudio-alsa pavucontrol python python-dbus python-pip rofi kitty scrot xclip ntfs-3g picom hsetroot ttf-font-awesome awesome-terminal-fonts noto-fonts-cjk

sudo pacman -S --needed git base-devel
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

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
