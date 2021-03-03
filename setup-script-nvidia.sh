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
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils unrar p7zip gamemode lib32-gamemode steam wine-staging lutris thunderbird qbittorrent discord telegram-desktop krita libreoffice-fresh obs-studio vlc bleachbit

#AUR Programs I use
yay -S birdtray-git retroarch-git retroarch-assets-git protontricks-git winetricks-git mellowplayer-git duckstation-git pcsx2-64bit-git minecraft-launcher teamviewer foxitreader davinci-resolve etcher-bin dxvk-bin minetime-bin standardnotes-bin visual-studio-code-bin dotnet-core-bin github-desktop-bin

#Install DXVK
setup_dxvk install

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
