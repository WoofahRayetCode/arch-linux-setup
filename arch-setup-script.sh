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
sudo pacman -S gamemode lib32-gamemode steam wine-staging winetricks lutris qbittorrent discord krita libreoffice-fresh vlc bleachbit

#AUR Programs I use
yay -S obs-studio-git protontricks minecraft-launcher steamcmd foxitreader mullvad-vpn bitwarden-bin davinci-resolve vscodium-bin vscodium-bin-marketplace github-desktop-bin etcher-bin minetime-bin standardnotes-bin 

#Simply reboot computer
sudo reboot
