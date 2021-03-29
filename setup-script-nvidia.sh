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
sudo pacman -S base-devel yay libratbag piper gamemode lib32-gamemode steam wine-staging lutris thunderbird qbittorrent discord telegram-desktop krita libreoffice-fresh vlc bleachbit

#AUR Programs I use
yay -S freedownloadmanager obs-studio-git birdtray-git retroarch-git retroarch-assets-git protontricks-git winetricks-git duckstation-git pcsx2-git rpcs3-git ppsspp-git vbam-git desmume-git citra-qt-git minecraft-launcher foxitreader etcher-bin dxvk minetime-bin standardnotes-bin

#Simply reboot computer
sudo reboot
