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
sudo pacman -S yay gamemode lib32-gamemode steam wine-staging lutris thunderbird qbittorrent discord telegram-desktop krita libreoffice-fresh vlc bleachbit

#AUR Programs I use
yay -S freedownloadmanager obs-studio-git birdtray-git retroarch-git retroarch-assets-git protontricks-git winetricks-git duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git vbam-git desmume-git citra-qt-git dolphin-emu-git minecraft-launcher foxitreader etcher-bin dxvk minetime-bin standardnotes-bin

#Nvidia CUDA Detection
nvidia-modprobe

#Simply reboot computer
sudo reboot
