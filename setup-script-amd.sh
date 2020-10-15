#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for main programs I use
sudo pacman -S yay nano gamemode lib32-gamemode wine-staging thunderbird qbittorrent krita obs-studio bleachbit libreoffice-fresh git steam discord telegram-desktop unrar p7zip gparted

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh
#Command for programs I use from the AUR
yay -S mesa-git lib32-mesa-git retroarch-git retroarch-assets-xmb-git pcsx2-git duckstation-git kdenlive-git minecraft-launcher teamviewer foxitreader timeshift etcher-bin bitwarden-bin github-desktop-bin code-git standardnotes-desktop

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc

#Simply reboot computer
sudo reboot
