#!/bin/bash
set -e

#Fully utilize the cpu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#For downloading and setting up Proton Updater for steam
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Change update branch to Unstable
sudo pacman-mirrors --api --set-branch unstable
sudo pacman-mirrors --fasttrack 5
sudo pacman -Syyu

#Remove stuff
sudo pacman -Rns firefox
sudo pacman -Rns gwenview
sudo pacman -Rns okular
sudo pacman -Rns htop
sudo pacman -Rns ksysguard
sudo pacman -Rns plasma-systemmonitor
sudo pacman -Rns kcalc
sudo pacman -Rns kdeconnect
sudo pacman -Rns yakuake

#Main programs I use
sudo pacman -S base-devel git yay plasma-systemmonitor qbittorrent electron qt gamemode lib32-gamemode steam wine-staging winetricks lutris discord telegram-desktop caprineclear
krita libreoffice-fresh vlc bleachbit guvcview

#AUR Programs I use
yay -S duckstation-git pcsx2-git ppsspp-git mgba-qt-git melonds-git goverlay protontricks davinci-resolve microsoft-edge-dev-bin signal-desktop-beta-bin etcher-bin bitwarden-bin standardnotes-bin

#To make sure programs can use the Nvidia GPU
nvidia-modprobe

#Clean leftover stuff
./clean-files.sh

#Hide icons
./hide-icons.sh
