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
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils nano ark unrar p7zip gamemode lib32-gamemode mgba-qt ppsspp steam wine-staging lutris iwd thunderbird qbittorrent discord telegram-desktop krita libreoffice-fresh obs-studio vlc bleachbit bluez bluez-utils blueman iwd networkmanager nm-connection-ecitor plasma-nm

#Enable bluetooth
systemctl start bluetooth.service
systemctl enable bluetooth.service

#Set iwd as wifi backend
cd /
cd /etc/
sudo mkdir NetworkManager
cd NetworkManager
sudo mkdir conf.d
cd conf.d
cd
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/wifi_backend.conf
sudo mv wifi_backend.conf /etc/NetworkManager/conf.d/

yay -S birdtray-git retroarch-git retroarch-assets-git protontricks-git winetricks-git mellowplayer-git duckstation-git pcsx2-64bit-git citra-git minecraft-launcher teamviewer foxitreader davinci-resolve etcher-bin

#Fully enable Teamviewer
teamviewer daemon start


#Widevine for MellowPlayer
curl -s "https://gitlab.com/ColinDuquesnoy/MellowPlayer/-/raw/master/scripts/install-widevine.sh" | bash

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Qtdq | pacman -Rns -
sudo pacman -Scc
yay -Scc

#Nvidia CUDA Detection
nvidia-modprobe

#Simply reboot computer
sudo reboot
