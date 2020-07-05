#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Remove vim and terminal, install Alacritty
sudo pacman -Rns vim
sudo pacman -Rns terminal


#Command for main programs I use
sudo pacman -S nano wine-staging chromium thunderbird qbittorrent krita bleachbit libreoffice-fresh git steam discord telegram-desktop vlc unrar p7zip ark gparted 

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/flubberding/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Set up yay
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#Command for programs I use from the AUR
yay -S mullvad-vpn retroarch-git retroarch-assets-xmb-git pcsx2-git minecraft-launcher teamviewer xdman pithos-git gamemode lib32-gamemode winetricks protontricks foxitreader davinci-resolve osu-lazer obs-studio-git atom-editor-bin simplenote-electron-bin

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc

#Simply reboot computer
sudo reboot
