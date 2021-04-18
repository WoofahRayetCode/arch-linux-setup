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
sudo pacman -S base-devel git virtualbox gamemode lib32-gamemode steam wine-staging winetricks lutris qbittorrent discord telegram-desktop krita libreoffice-fresh vlc bleachbit

#YAY Setup
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#AUR Programs I use
yay -S nvidia-beta retroarch-git retroarch-assets-git duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-git desmume-git citra-git obs-studio-git protontricks minecraft-launcher steamcmd foxitreader mullvad-vpn github-desktop-bin etcher-bin minetime-bin standardnotes-bin davinci-resolve

#Simply reboot computer
sudo reboot
