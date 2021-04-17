#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Main programs I use
sudo pacman -S base-devel git virtualbox nvidia nvidia-settings gamemode lib32-gamemode steam wine-staging lutris qbittorrent discord telegram-desktop krita libreoffice-fresh vlc bleachbit

#YAY Setup
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#AUR Programs I use
yay -S protontricks-git winetricks-git retroarch-git retroarch-assets-git obs-studio-git unityhub minecraft-launcher steamcmd dxvk foxitreader mullvad-vpn github-desktop-bin etcher-bin minetime-bin standardnotes-bin davinci-resolve

#Simply reboot computer
sudo reboot
