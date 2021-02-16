#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Set iwd as wifi backend
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/wifi_backend.conf
mv wifi_backend.conf /etc/NetworkManager/conf.d/

#Main programs I use
sudo pacman -S nvidia nvidia-settings nvidia-utils lib32-nvidia-utils nano ark unrar p7zip gamemode lib32-gamemode steam wine-staging lutris iwd thunderbird qbittorrent discord telegram-desktop krita libreoffice-fresh obs-studio vlc bleachbit bluez bluez-utils blueman

#Yay setup
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

yay -S birdtray-git retroarch-git retroarch-assets-git minecraft-launcher protontricks-git winetricks-git mellowplayer-git teamviewer foxitreader davinci-resolve

#Fully enable Teamviewer
sudo teamviewer daemon restart
sudo teamviewer daemon disable
sudo teamviewer daemon enable


#Widevine for MellowPlayer
curl -s "https://gitlab.com/ColinDuquesnoy/MellowPlayer/-/raw/master/scripts/install-widevine.sh" | bash

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc

#Nvidia CUDA Detection
nvidia-modprobe

#Simply reboot computer
sudo reboot
