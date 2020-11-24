#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for main programs I use
sudo pacman -S qt nvidia nvidia-settings lib32-nvidia-utils nvidia-utils nano gamemode lib32-gamemode wine-staging thunderbird qbittorrent krita obs-studio kdenlive vlc bleachbit libreoffice-fresh git steam lutris discord telegram-desktop ark unrar p7zip

#Yay setup
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Command for programs I use from the AUR
yay -S birdtray-git duckstation pcsx2-git retroarch-git retroarch-assets-git minecraft-launcher protontricks-git winetricks-git mellowplayer-git teamviewer foxitreader bitwarden-bin github-desktop-bin atom-editor-bin

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc

#Nvidia CUDA Detection
nvidia-modprobe

#Simply reboot computer
sudo reboot
