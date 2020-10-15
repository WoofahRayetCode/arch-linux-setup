#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for main programs I use
sudo pacman -S nvidia lib32-nvidia-utils nvidia-utils nvidia-settings yay nano gamemode lib32-gamemode wine-staging thunderbird qbittorrent krita obs-studio bleachbit libreoffice-fresh git steam lutris discord telegram-desktop unrar p7zip

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Clone yay and install
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#Command for programs I use from the AUR
yay -S retroarch-git retroarch-assets-xmb-git pcsx2-git duckstation-git insync kdenlive-git minecraft-launcher teamviewer foxitreader timeshift etcher-bin bitwarden-bin github-desktop-bin code-git standardnotes-desktop

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc

#Simply reboot computer
sudo reboot
